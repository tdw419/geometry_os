; DESCRIPTION: Creates a red rectangular region at (97, 231) spanning 76 by 16 pixels.
; PLAN: r0=97(x), r1=231(y), r2=76(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 231
LDI r2, 76
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
