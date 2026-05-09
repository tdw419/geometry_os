; DESCRIPTION: Creates a yellow rectangular region at (126, 145) spanning 111 by 21 pixels.
; PLAN: r0=126(x), r1=145(y), r2=111(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 145
LDI r2, 111
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
