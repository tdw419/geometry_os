; DESCRIPTION: Renders a magenta box of size 82x75 starting at (234, 154).
; PLAN: r0=234(x), r1=154(y), r2=82(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 154
LDI r2, 82
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
