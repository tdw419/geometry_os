; DESCRIPTION: Creates a cyan rectangular region at (19, 137) spanning 72 by 50 pixels.
; PLAN: r0=19(x), r1=137(y), r2=72(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 137
LDI r2, 72
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
