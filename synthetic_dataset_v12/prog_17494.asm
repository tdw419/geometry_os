; DESCRIPTION: Creates a cyan rectangular region at (225, 164) spanning 105 by 58 pixels.
; PLAN: r0=225(x), r1=164(y), r2=105(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 164
LDI r2, 105
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
