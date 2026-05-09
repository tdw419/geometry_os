; DESCRIPTION: Creates a green rectangular region at (42, 121) spanning 79 by 104 pixels.
; PLAN: r0=42(x), r1=121(y), r2=79(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 121
LDI r2, 79
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
