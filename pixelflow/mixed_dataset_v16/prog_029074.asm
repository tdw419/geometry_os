; DESCRIPTION: Places a yellow 109x84 rectangle at position (274, 17).
; PLAN: r0=274(x), r1=17(y), r2=109(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 17
LDI r2, 109
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
