; DESCRIPTION: Renders a purple box of size 112x35 starting at (277, 117).
; PLAN: r0=277(x), r1=117(y), r2=112(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 117
LDI r2, 112
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
