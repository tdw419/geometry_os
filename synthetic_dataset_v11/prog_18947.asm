; DESCRIPTION: Creates a yellow rectangular region at (237, 58) spanning 17 by 109 pixels.
; PLAN: r0=237(x), r1=58(y), r2=17(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 58
LDI r2, 17
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
