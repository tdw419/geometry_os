; DESCRIPTION: Renders a magenta box of size 86x31 starting at (335, 38).
; PLAN: r0=335(x), r1=38(y), r2=86(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 38
LDI r2, 86
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
