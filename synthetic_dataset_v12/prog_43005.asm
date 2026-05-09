; DESCRIPTION: Renders a magenta box of size 87x61 starting at (188, 16).
; PLAN: r0=188(x), r1=16(y), r2=87(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 16
LDI r2, 87
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
