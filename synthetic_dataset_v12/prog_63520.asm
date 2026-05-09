; DESCRIPTION: Renders a purple box of size 111x31 starting at (319, 33).
; PLAN: r0=319(x), r1=33(y), r2=111(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 33
LDI r2, 111
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
