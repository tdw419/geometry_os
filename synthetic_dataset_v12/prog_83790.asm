; DESCRIPTION: Creates a yellow rectangular region at (198, 172) spanning 109 by 25 pixels.
; PLAN: r0=198(x), r1=172(y), r2=109(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 172
LDI r2, 109
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
