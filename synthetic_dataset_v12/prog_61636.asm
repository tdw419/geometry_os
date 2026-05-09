; DESCRIPTION: Creates a cyan rectangular region at (288, 117) spanning 66 by 48 pixels.
; PLAN: r0=288(x), r1=117(y), r2=66(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 117
LDI r2, 66
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
