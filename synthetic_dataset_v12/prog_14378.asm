; DESCRIPTION: Creates a magenta rectangular region at (256, 104) spanning 70 by 109 pixels.
; PLAN: r0=256(x), r1=104(y), r2=70(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 104
LDI r2, 70
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
