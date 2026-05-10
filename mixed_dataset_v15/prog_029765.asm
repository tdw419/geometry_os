; DESCRIPTION: Creates a magenta rectangular region at (242, 30) spanning 10 by 79 pixels.
; PLAN: r0=242(x), r1=30(y), r2=10(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 30
LDI r2, 10
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
