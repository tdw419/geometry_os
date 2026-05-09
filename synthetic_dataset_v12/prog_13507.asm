; DESCRIPTION: Creates a yellow rectangular region at (330, 103) spanning 63 by 56 pixels.
; PLAN: r0=330(x), r1=103(y), r2=63(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 103
LDI r2, 63
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
