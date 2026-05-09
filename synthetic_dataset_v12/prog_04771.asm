; DESCRIPTION: Creates a green rectangular region at (419, 79) spanning 28 by 103 pixels.
; PLAN: r0=419(x), r1=79(y), r2=28(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 79
LDI r2, 28
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
