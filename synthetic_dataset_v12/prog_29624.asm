; DESCRIPTION: Creates a cyan rectangular region at (175, 48) spanning 97 by 86 pixels.
; PLAN: r0=175(x), r1=48(y), r2=97(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 48
LDI r2, 97
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
