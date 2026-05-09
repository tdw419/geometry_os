; DESCRIPTION: Creates a cyan rectangular region at (227, 196) spanning 105 by 37 pixels.
; PLAN: r0=227(x), r1=196(y), r2=105(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 196
LDI r2, 105
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
