; DESCRIPTION: Composite: . Then Places a white dot at position (44, 90). Then Places a yellow 26x95 rectangle at position (178, 49).
; PLAN: r0=44(x), r1=90(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=178(x), r1=49(y), r2=26(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (44, 90).
; PLAN: r0=44(x), r1=90(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 90
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 26x95 rectangle at position (178, 49).
; PLAN: r0=178(x), r1=49(y), r2=26(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 49
LDI r2, 26
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
