; DESCRIPTION: Composite: . Then Places a cyan dot at position (166, 199). Then Places a green 111x66 rectangle at position (25, 41).
; PLAN: r0=166(x), r1=199(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=25(x), r1=41(y), r2=111(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (166, 199).
; PLAN: r0=166(x), r1=199(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 199
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a green 111x66 rectangle at position (25, 41).
; PLAN: r0=25(x), r1=41(y), r2=111(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 41
LDI r2, 111
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
