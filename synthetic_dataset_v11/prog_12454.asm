; DESCRIPTION: Composite: . Then Sets a single red pixel at (207, 248). Then Places a cyan circle of radius 27 at center (113, 68).
; PLAN: r0=207(x), r1=248(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=113(x), r1=68(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (207, 248).
; PLAN: r0=207(x), r1=248(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 248
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 27 at center (113, 68).
; PLAN: r0=113(x), r1=68(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 68
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
