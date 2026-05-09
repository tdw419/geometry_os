; DESCRIPTION: Creates a cyan rectangular region at (98, 58) spanning 53 by 86 pixels.
; PLAN: r0=98(x), r1=58(y), r2=53(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 58
LDI r2, 53
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
