; DESCRIPTION: Renders a green box of size 73x47 starting at (380, 22).
; PLAN: r0=380(x), r1=22(y), r2=73(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 22
LDI r2, 73
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
