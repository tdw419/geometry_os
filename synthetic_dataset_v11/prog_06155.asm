; DESCRIPTION: Creates a white rectangular region at (132, 16) spanning 81 by 79 pixels.
; PLAN: r0=132(x), r1=16(y), r2=81(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 16
LDI r2, 81
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
