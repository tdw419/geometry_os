; DESCRIPTION: Renders a yellow rectangular region spanning 16 by 49 at (350, 87).
; PLAN: r0=350(x), r1=87(y), r2=16(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 87
LDI r2, 16
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
