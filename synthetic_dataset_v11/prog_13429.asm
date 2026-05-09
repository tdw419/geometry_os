; DESCRIPTION: Renders a purple box of size 33x90 starting at (44, 144).
; PLAN: r0=44(x), r1=144(y), r2=33(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 144
LDI r2, 33
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
