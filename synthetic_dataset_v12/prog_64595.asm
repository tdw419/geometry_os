; DESCRIPTION: Renders a magenta box of size 72x87 starting at (83, 157).
; PLAN: r0=83(x), r1=157(y), r2=72(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 157
LDI r2, 72
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
