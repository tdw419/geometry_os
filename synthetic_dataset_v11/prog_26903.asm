; DESCRIPTION: Creates a cyan rectangular region at (7, 60) spanning 34 by 21 pixels.
; PLAN: r0=7(x), r1=60(y), r2=34(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 60
LDI r2, 34
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
