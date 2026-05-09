; DESCRIPTION: Creates a cyan rectangular region at (25, 231) spanning 10 by 25 pixels.
; PLAN: r0=25(x), r1=231(y), r2=10(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 231
LDI r2, 10
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
