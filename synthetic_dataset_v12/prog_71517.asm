; DESCRIPTION: Places a green 17x11 rectangle at position (449, 178).
; PLAN: r0=449(x), r1=178(y), r2=17(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 178
LDI r2, 17
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
