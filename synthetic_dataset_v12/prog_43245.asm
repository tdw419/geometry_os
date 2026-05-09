; DESCRIPTION: Creates a cyan rectangular region at (338, 57) spanning 66 by 80 pixels.
; PLAN: r0=338(x), r1=57(y), r2=66(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 57
LDI r2, 66
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
