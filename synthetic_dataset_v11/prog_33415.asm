; DESCRIPTION: Creates a black rectangular region at (32, 152) spanning 99 by 50 pixels.
; PLAN: r0=32(x), r1=152(y), r2=99(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 152
LDI r2, 99
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
