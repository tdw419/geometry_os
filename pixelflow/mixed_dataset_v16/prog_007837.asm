; DESCRIPTION: Renders a magenta box of size 110x32 starting at (157, 86).
; PLAN: r0=157(x), r1=86(y), r2=110(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 86
LDI r2, 110
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
