; DESCRIPTION: Places a yellow 110x60 rectangle at position (391, 123).
; PLAN: r0=391(x), r1=123(y), r2=110(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 123
LDI r2, 110
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
