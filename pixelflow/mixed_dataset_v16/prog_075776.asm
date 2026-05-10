; DESCRIPTION: Creates a green rectangular region at (262, 87) spanning 29 by 73 pixels.
; PLAN: r0=262(x), r1=87(y), r2=29(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 87
LDI r2, 29
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
