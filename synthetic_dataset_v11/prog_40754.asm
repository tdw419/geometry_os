; DESCRIPTION: Renders a green box of size 54x117 starting at (95, 37).
; PLAN: r0=95(x), r1=37(y), r2=54(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 37
LDI r2, 54
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
