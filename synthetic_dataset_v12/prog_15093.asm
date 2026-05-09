; DESCRIPTION: Creates a cyan rectangular region at (423, 141) spanning 15 by 48 pixels.
; PLAN: r0=423(x), r1=141(y), r2=15(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 141
LDI r2, 15
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
