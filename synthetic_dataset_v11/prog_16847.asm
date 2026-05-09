; DESCRIPTION: Renders a purple box of size 89x42 starting at (63, 157).
; PLAN: r0=63(x), r1=157(y), r2=89(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 157
LDI r2, 89
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
