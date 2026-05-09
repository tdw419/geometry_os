; DESCRIPTION: Renders a blue box of size 15x71 starting at (434, 70).
; PLAN: r0=434(x), r1=70(y), r2=15(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 70
LDI r2, 15
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
