; DESCRIPTION: Creates a cyan rectangular region at (75, 53) spanning 39 by 58 pixels.
; PLAN: r0=75(x), r1=53(y), r2=39(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 53
LDI r2, 39
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
