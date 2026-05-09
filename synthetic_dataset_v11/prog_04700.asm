; DESCRIPTION: Creates a cyan rectangular region at (208, 113) spanning 26 by 101 pixels.
; PLAN: r0=208(x), r1=113(y), r2=26(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 113
LDI r2, 26
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
