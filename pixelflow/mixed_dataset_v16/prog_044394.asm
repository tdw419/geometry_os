; DESCRIPTION: Creates a magenta rectangular region at (363, 80) spanning 113 by 104 pixels.
; PLAN: r0=363(x), r1=80(y), r2=113(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 80
LDI r2, 113
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
