; DESCRIPTION: Renders a magenta box of size 31x25 starting at (179, 65).
; PLAN: r0=179(x), r1=65(y), r2=31(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 65
LDI r2, 31
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
