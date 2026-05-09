; DESCRIPTION: Renders a purple box of size 86x64 starting at (107, 99).
; PLAN: r0=107(x), r1=99(y), r2=86(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 99
LDI r2, 86
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
