; DESCRIPTION: Places a yellow 35x43 rectangle at position (248, 200).
; PLAN: r0=248(x), r1=200(y), r2=35(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 200
LDI r2, 35
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
