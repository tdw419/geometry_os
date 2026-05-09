; DESCRIPTION: Creates a magenta rectangular region at (45, 154) spanning 22 by 80 pixels.
; PLAN: r0=45(x), r1=154(y), r2=22(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 154
LDI r2, 22
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
