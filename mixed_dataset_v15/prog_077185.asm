; DESCRIPTION: Creates a cyan rectangular region at (439, 45) spanning 26 by 46 pixels.
; PLAN: r0=439(x), r1=45(y), r2=26(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 45
LDI r2, 26
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
