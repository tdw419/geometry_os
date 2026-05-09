; DESCRIPTION: Places a green 115x17 rectangle at position (18, 43).
; PLAN: r0=18(x), r1=43(y), r2=115(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 43
LDI r2, 115
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
