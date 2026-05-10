; DESCRIPTION: Renders a yellow rectangular region spanning 26 by 48 at (221, 33).
; PLAN: r0=221(x), r1=33(y), r2=26(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 33
LDI r2, 26
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
