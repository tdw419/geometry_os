; DESCRIPTION: Places a yellow 102x37 rectangle at position (17, 62).
; PLAN: r0=17(x), r1=62(y), r2=102(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 62
LDI r2, 102
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
