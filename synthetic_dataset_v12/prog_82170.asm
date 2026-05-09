; DESCRIPTION: Creates a cyan rectangular region at (346, 211) spanning 101 by 25 pixels.
; PLAN: r0=346(x), r1=211(y), r2=101(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 211
LDI r2, 101
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
