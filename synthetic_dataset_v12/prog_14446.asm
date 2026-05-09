; DESCRIPTION: Renders a purple box of size 32x60 starting at (434, 80).
; PLAN: r0=434(x), r1=80(y), r2=32(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 80
LDI r2, 32
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
