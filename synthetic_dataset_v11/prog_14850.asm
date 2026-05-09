; DESCRIPTION: Renders a magenta box of size 75x97 starting at (110, 154).
; PLAN: r0=110(x), r1=154(y), r2=75(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 154
LDI r2, 75
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
