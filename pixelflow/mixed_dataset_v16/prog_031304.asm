; DESCRIPTION: Creates a cyan rectangular region at (22, 58) spanning 98 by 17 pixels.
; PLAN: r0=22(x), r1=58(y), r2=98(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 58
LDI r2, 98
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
