; DESCRIPTION: Creates a green rectangular region at (143, 8) spanning 30 by 55 pixels.
; PLAN: r0=143(x), r1=8(y), r2=30(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 8
LDI r2, 30
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
