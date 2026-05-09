; DESCRIPTION: Renders a magenta box of size 63x60 starting at (16, 75).
; PLAN: r0=16(x), r1=75(y), r2=63(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 75
LDI r2, 63
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
