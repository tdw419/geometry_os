; DESCRIPTION: Creates a green rectangular region at (143, 152) spanning 29 by 94 pixels.
; PLAN: r0=143(x), r1=152(y), r2=29(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 152
LDI r2, 29
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
