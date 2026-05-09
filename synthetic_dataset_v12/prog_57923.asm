; DESCRIPTION: Creates a cyan rectangular region at (273, 154) spanning 20 by 53 pixels.
; PLAN: r0=273(x), r1=154(y), r2=20(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 154
LDI r2, 20
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
