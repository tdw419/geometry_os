; DESCRIPTION: Places a green 17x52 rectangle at position (105, 138).
; PLAN: r0=105(x), r1=138(y), r2=17(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 138
LDI r2, 17
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
