; DESCRIPTION: Creates a cyan rectangular region at (266, 231) spanning 18 by 24 pixels.
; PLAN: r0=266(x), r1=231(y), r2=18(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 231
LDI r2, 18
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
