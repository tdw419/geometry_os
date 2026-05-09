; DESCRIPTION: Renders a purple box of size 70x113 starting at (112, 80).
; PLAN: r0=112(x), r1=80(y), r2=70(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 80
LDI r2, 70
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
