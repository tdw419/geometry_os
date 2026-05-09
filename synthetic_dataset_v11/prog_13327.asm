; DESCRIPTION: Composite: . Then Places a orange 19x23 rectangle at position (96, 8). Then Places a white dot at position (17, 188).
; PLAN: r0=96(x), r1=8(y), r2=19(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=17(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange 19x23 rectangle at position (96, 8).
; PLAN: r0=96(x), r1=8(y), r2=19(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 8
LDI r2, 19
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (17, 188).
; PLAN: r0=17(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
