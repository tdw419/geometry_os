; DESCRIPTION: Places a green 115x98 rectangle at position (17, 5).
; PLAN: r0=17(x), r1=5(y), r2=115(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 5
LDI r2, 115
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
