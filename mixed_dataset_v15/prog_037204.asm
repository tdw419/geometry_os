; DESCRIPTION: Creates a cyan rectangular region at (342, 172) spanning 96 by 76 pixels.
; PLAN: r0=342(x), r1=172(y), r2=96(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 172
LDI r2, 96
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
