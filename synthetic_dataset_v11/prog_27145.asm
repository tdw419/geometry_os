; DESCRIPTION: Creates a cyan rectangular region at (7, 136) spanning 25 by 35 pixels.
; PLAN: r0=7(x), r1=136(y), r2=25(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 136
LDI r2, 25
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
