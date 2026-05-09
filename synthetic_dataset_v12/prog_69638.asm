; DESCRIPTION: Creates a yellow rectangular region at (57, 117) spanning 79 by 17 pixels.
; PLAN: r0=57(x), r1=117(y), r2=79(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 117
LDI r2, 79
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
