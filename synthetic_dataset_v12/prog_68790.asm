; DESCRIPTION: Creates a cyan rectangular region at (439, 23) spanning 30 by 69 pixels.
; PLAN: r0=439(x), r1=23(y), r2=30(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 23
LDI r2, 30
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
