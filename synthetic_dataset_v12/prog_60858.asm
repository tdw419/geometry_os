; DESCRIPTION: Creates a cyan rectangular region at (363, 95) spanning 80 by 11 pixels.
; PLAN: r0=363(x), r1=95(y), r2=80(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 95
LDI r2, 80
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
