; DESCRIPTION: Renders a green box of size 81x22 starting at (177, 161).
; PLAN: r0=177(x), r1=161(y), r2=81(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 161
LDI r2, 81
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
