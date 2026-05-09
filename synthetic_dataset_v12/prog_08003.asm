; DESCRIPTION: Creates a magenta rectangular region at (260, 92) spanning 90 by 120 pixels.
; PLAN: r0=260(x), r1=92(y), r2=90(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 92
LDI r2, 90
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
