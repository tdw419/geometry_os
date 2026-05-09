; DESCRIPTION: Creates a cyan rectangular region at (175, 77) spanning 10 by 58 pixels.
; PLAN: r0=175(x), r1=77(y), r2=10(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 77
LDI r2, 10
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
