; DESCRIPTION: Places a yellow 96x35 rectangle at position (33, 147).
; PLAN: r0=33(x), r1=147(y), r2=96(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 147
LDI r2, 96
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
