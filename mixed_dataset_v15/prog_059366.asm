; DESCRIPTION: Creates a cyan rectangular region at (163, 176) spanning 72 by 54 pixels.
; PLAN: r0=163(x), r1=176(y), r2=72(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 176
LDI r2, 72
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
