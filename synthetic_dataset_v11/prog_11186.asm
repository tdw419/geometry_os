; DESCRIPTION: Creates a cyan rectangular region at (38, 117) spanning 84 by 103 pixels.
; PLAN: r0=38(x), r1=117(y), r2=84(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 117
LDI r2, 84
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
