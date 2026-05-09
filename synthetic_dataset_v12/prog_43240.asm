; DESCRIPTION: Creates a yellow rectangular region at (196, 63) spanning 50 by 17 pixels.
; PLAN: r0=196(x), r1=63(y), r2=50(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 63
LDI r2, 50
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
