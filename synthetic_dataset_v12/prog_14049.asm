; DESCRIPTION: Creates a magenta rectangular region at (154, 162) spanning 102 by 52 pixels.
; PLAN: r0=154(x), r1=162(y), r2=102(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 162
LDI r2, 102
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
