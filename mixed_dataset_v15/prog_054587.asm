; DESCRIPTION: Places a blue 107x17 rectangle at position (137, 129).
; PLAN: r0=137(x), r1=129(y), r2=107(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 129
LDI r2, 107
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
