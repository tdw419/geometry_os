; DESCRIPTION: Creates a cyan rectangular region at (184, 201) spanning 72 by 21 pixels.
; PLAN: r0=184(x), r1=201(y), r2=72(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 201
LDI r2, 72
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
