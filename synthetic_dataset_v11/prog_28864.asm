; DESCRIPTION: Creates a cyan rectangular region at (12, 176) spanning 72 by 30 pixels.
; PLAN: r0=12(x), r1=176(y), r2=72(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 176
LDI r2, 72
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
