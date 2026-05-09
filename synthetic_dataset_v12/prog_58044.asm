; DESCRIPTION: Places a yellow 17x15 rectangle at position (254, 12).
; PLAN: r0=254(x), r1=12(y), r2=17(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 12
LDI r2, 17
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
