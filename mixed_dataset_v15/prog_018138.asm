; DESCRIPTION: Renders a purple box of size 25x60 starting at (271, 113).
; PLAN: r0=271(x), r1=113(y), r2=25(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 113
LDI r2, 25
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
