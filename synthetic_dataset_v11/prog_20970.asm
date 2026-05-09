; DESCRIPTION: Creates a yellow rectangular region at (151, 44) spanning 94 by 117 pixels.
; PLAN: r0=151(x), r1=44(y), r2=94(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 44
LDI r2, 94
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
