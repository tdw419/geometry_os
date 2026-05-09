; DESCRIPTION: Creates a cyan rectangular region at (131, 170) spanning 21 by 25 pixels.
; PLAN: r0=131(x), r1=170(y), r2=21(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 170
LDI r2, 21
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
