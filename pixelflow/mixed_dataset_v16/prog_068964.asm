; DESCRIPTION: Creates a cyan rectangular region at (223, 175) spanning 105 by 50 pixels.
; PLAN: r0=223(x), r1=175(y), r2=105(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 175
LDI r2, 105
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
