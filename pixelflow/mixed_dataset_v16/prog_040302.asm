; DESCRIPTION: Renders a magenta box of size 83x19 starting at (156, 86).
; PLAN: r0=156(x), r1=86(y), r2=83(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 86
LDI r2, 83
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
