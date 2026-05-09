; DESCRIPTION: Renders a purple box of size 94x20 starting at (126, 113).
; PLAN: r0=126(x), r1=113(y), r2=94(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 113
LDI r2, 94
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
