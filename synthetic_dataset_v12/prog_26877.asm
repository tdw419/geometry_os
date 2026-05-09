; DESCRIPTION: Renders a purple box of size 116x70 starting at (64, 164).
; PLAN: r0=64(x), r1=164(y), r2=116(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 164
LDI r2, 116
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
