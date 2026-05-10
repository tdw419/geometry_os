; DESCRIPTION: Renders a yellow rectangular region spanning 94 by 33 at (221, 128).
; PLAN: r0=221(x), r1=128(y), r2=94(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 128
LDI r2, 94
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
