; DESCRIPTION: Creates a cyan rectangular region at (33, 74) spanning 29 by 35 pixels.
; PLAN: r0=33(x), r1=74(y), r2=29(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 74
LDI r2, 29
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
