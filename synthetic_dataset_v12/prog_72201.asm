; DESCRIPTION: Creates a cyan rectangular region at (75, 192) spanning 95 by 11 pixels.
; PLAN: r0=75(x), r1=192(y), r2=95(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 192
LDI r2, 95
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
