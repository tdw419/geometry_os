; DESCRIPTION: Renders a purple box of size 99x32 starting at (79, 63).
; PLAN: r0=79(x), r1=63(y), r2=99(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 63
LDI r2, 99
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
