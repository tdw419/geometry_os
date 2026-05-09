; DESCRIPTION: Renders a purple box of size 28x64 starting at (60, 159).
; PLAN: r0=60(x), r1=159(y), r2=28(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 159
LDI r2, 28
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
