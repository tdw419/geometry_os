; DESCRIPTION: Creates a magenta rectangular region at (92, 120) spanning 64 by 106 pixels.
; PLAN: r0=92(x), r1=120(y), r2=64(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 120
LDI r2, 64
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
