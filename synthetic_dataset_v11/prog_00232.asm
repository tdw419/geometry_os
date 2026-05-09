; DESCRIPTION: Renders a green box of size 47x36 starting at (95, 164).
; PLAN: r0=95(x), r1=164(y), r2=47(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 164
LDI r2, 47
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
