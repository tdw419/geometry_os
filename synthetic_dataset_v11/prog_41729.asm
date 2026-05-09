; DESCRIPTION: Creates a yellow rectangular region at (230, 160) spanning 17 by 37 pixels.
; PLAN: r0=230(x), r1=160(y), r2=17(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 160
LDI r2, 17
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
