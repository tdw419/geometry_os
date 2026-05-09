; DESCRIPTION: Creates a cyan rectangular region at (98, 30) spanning 58 by 80 pixels.
; PLAN: r0=98(x), r1=30(y), r2=58(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 30
LDI r2, 58
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
