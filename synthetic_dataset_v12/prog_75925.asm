; DESCRIPTION: Renders a purple box of size 15x91 starting at (420, 29).
; PLAN: r0=420(x), r1=29(y), r2=15(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 29
LDI r2, 15
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
