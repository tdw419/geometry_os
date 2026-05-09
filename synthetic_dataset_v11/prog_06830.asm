; DESCRIPTION: Composite: . Then Places a green 26x107 rectangle at position (132, 115). Then Places a blue dot at position (43, 218).
; PLAN: r0=132(x), r1=115(y), r2=26(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=43(x), r1=218(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green 26x107 rectangle at position (132, 115).
; PLAN: r0=132(x), r1=115(y), r2=26(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 115
LDI r2, 26
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (43, 218).
; PLAN: r0=43(x), r1=218(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 218
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
