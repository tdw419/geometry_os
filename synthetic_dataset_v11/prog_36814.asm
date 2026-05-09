; DESCRIPTION: Creates a cyan rectangular region at (193, 85) spanning 12 by 80 pixels.
; PLAN: r0=193(x), r1=85(y), r2=12(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 85
LDI r2, 12
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
