; DESCRIPTION: Renders a magenta box of size 83x87 starting at (200, 159).
; PLAN: r0=200(x), r1=159(y), r2=83(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 159
LDI r2, 83
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
