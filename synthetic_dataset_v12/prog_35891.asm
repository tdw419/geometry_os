; DESCRIPTION: Creates a green rectangular region at (173, 58) spanning 31 by 16 pixels.
; PLAN: r0=173(x), r1=58(y), r2=31(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 58
LDI r2, 31
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
