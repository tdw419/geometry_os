; DESCRIPTION: Renders a green box of size 96x29 starting at (106, 199).
; PLAN: r0=106(x), r1=199(y), r2=96(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 199
LDI r2, 96
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
