; DESCRIPTION: Renders a purple box of size 15x64 starting at (272, 131).
; PLAN: r0=272(x), r1=131(y), r2=15(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 131
LDI r2, 15
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
