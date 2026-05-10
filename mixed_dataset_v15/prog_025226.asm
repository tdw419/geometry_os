; DESCRIPTION: Places a yellow 76x27 rectangle at position (137, 110).
; PLAN: r0=137(x), r1=110(y), r2=76(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 110
LDI r2, 76
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
