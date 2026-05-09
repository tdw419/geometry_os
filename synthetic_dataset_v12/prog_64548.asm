; DESCRIPTION: Places a yellow 105x19 rectangle at position (318, 237).
; PLAN: r0=318(x), r1=237(y), r2=105(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 237
LDI r2, 105
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
