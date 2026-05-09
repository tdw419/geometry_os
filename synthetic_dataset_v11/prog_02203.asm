; DESCRIPTION: Composite: . Then Places a cyan 25x44 rectangle at position (126, 120). Then Places a orange dot at position (77, 142).
; PLAN: r0=126(x), r1=120(y), r2=25(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=77(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 25x44 rectangle at position (126, 120).
; PLAN: r0=126(x), r1=120(y), r2=25(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 120
LDI r2, 25
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (77, 142).
; PLAN: r0=77(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
