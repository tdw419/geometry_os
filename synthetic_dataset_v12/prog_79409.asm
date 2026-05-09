; DESCRIPTION: Creates a cyan rectangular region at (376, 6) spanning 12 by 108 pixels.
; PLAN: r0=376(x), r1=6(y), r2=12(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 6
LDI r2, 12
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
