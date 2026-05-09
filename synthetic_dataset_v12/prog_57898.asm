; DESCRIPTION: Creates a cyan rectangular region at (80, 143) spanning 90 by 75 pixels.
; PLAN: r0=80(x), r1=143(y), r2=90(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 143
LDI r2, 90
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
