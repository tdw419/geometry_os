; DESCRIPTION: Composite: . Then Places a cyan 37x39 rectangle at position (197, 145). Then Sets a single cyan pixel at (170, 229).
; PLAN: r0=197(x), r1=145(y), r2=37(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=170(x), r1=229(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 37x39 rectangle at position (197, 145).
; PLAN: r0=197(x), r1=145(y), r2=37(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 145
LDI r2, 37
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (170, 229).
; PLAN: r0=170(x), r1=229(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 229
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
