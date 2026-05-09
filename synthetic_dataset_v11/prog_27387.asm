; DESCRIPTION: Creates a cyan rectangular region at (152, 162) spanning 66 by 40 pixels.
; PLAN: r0=152(x), r1=162(y), r2=66(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 162
LDI r2, 66
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
