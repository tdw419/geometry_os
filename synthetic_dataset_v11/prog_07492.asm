; DESCRIPTION: Creates a cyan rectangular region at (185, 201) spanning 39 by 33 pixels.
; PLAN: r0=185(x), r1=201(y), r2=39(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 201
LDI r2, 39
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
