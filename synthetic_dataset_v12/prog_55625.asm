; DESCRIPTION: Creates a cyan rectangular region at (13, 169) spanning 39 by 66 pixels.
; PLAN: r0=13(x), r1=169(y), r2=39(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 169
LDI r2, 39
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
