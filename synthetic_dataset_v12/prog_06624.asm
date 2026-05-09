; DESCRIPTION: Places a green 17x105 rectangle at position (421, 144).
; PLAN: r0=421(x), r1=144(y), r2=17(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 144
LDI r2, 17
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
