; DESCRIPTION: Creates a red rectangular region at (28, 181) spanning 104 by 32 pixels.
; PLAN: r0=28(x), r1=181(y), r2=104(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 181
LDI r2, 104
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
