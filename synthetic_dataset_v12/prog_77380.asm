; DESCRIPTION: Creates a cyan rectangular region at (255, 87) spanning 36 by 79 pixels.
; PLAN: r0=255(x), r1=87(y), r2=36(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 87
LDI r2, 36
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
