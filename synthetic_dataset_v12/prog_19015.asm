; DESCRIPTION: Creates a red rectangular region at (32, 145) spanning 116 by 104 pixels.
; PLAN: r0=32(x), r1=145(y), r2=116(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 145
LDI r2, 116
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
