; DESCRIPTION: Renders a green box of size 106x29 starting at (279, 23).
; PLAN: r0=279(x), r1=23(y), r2=106(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 23
LDI r2, 106
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
