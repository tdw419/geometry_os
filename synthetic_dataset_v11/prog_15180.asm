; DESCRIPTION: Creates a magenta rectangular region at (47, 136) spanning 104 by 120 pixels.
; PLAN: r0=47(x), r1=136(y), r2=104(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 136
LDI r2, 104
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
