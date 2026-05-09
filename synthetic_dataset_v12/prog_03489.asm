; DESCRIPTION: Renders a magenta box of size 79x91 starting at (257, 86).
; PLAN: r0=257(x), r1=86(y), r2=79(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 86
LDI r2, 79
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
