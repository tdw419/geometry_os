; DESCRIPTION: Composite: . Then Places a black 15x79 rectangle at position (226, 123). Then Sets a single cyan pixel at (225, 174).
; PLAN: r0=226(x), r1=123(y), r2=15(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=225(x), r1=174(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 15x79 rectangle at position (226, 123).
; PLAN: r0=226(x), r1=123(y), r2=15(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 123
LDI r2, 15
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (225, 174).
; PLAN: r0=225(x), r1=174(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 174
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
