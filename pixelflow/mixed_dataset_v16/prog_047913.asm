; DESCRIPTION: Creates a cyan rectangular region at (390, 103) spanning 49 by 12 pixels.
; PLAN: r0=390(x), r1=103(y), r2=49(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 103
LDI r2, 49
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
