; DESCRIPTION: Composite: . Then Places a white 100x68 rectangle at position (143, 149). Then Places a white dot at position (126, 24).
; PLAN: r0=143(x), r1=149(y), r2=100(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=126(x), r1=24(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 100x68 rectangle at position (143, 149).
; PLAN: r0=143(x), r1=149(y), r2=100(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 149
LDI r2, 100
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (126, 24).
; PLAN: r0=126(x), r1=24(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 24
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
