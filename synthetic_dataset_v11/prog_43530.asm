; DESCRIPTION: Creates a cyan rectangular region at (132, 152) spanning 13 by 49 pixels.
; PLAN: r0=132(x), r1=152(y), r2=13(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 152
LDI r2, 13
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
