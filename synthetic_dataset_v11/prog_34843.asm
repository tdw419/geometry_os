; DESCRIPTION: Renders a purple box of size 36x33 starting at (47, 113).
; PLAN: r0=47(x), r1=113(y), r2=36(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 113
LDI r2, 36
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
