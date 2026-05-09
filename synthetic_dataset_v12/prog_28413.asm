; DESCRIPTION: Creates a red rectangular region at (249, 108) spanning 84 by 104 pixels.
; PLAN: r0=249(x), r1=108(y), r2=84(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 108
LDI r2, 84
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
