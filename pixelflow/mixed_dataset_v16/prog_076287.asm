; DESCRIPTION: Renders a magenta box of size 63x120 starting at (434, 26).
; PLAN: r0=434(x), r1=26(y), r2=63(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 26
LDI r2, 63
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
