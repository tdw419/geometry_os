; DESCRIPTION: Renders a magenta box of size 84x20 starting at (317, 219).
; PLAN: r0=317(x), r1=219(y), r2=84(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 219
LDI r2, 84
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
