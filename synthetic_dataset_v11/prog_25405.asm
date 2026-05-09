; DESCRIPTION: Composite: . Then Places a red 44x30 rectangle at position (157, 162). Then Sets a single black pixel at (251, 208).
; PLAN: r0=157(x), r1=162(y), r2=44(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=251(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 44x30 rectangle at position (157, 162).
; PLAN: r0=157(x), r1=162(y), r2=44(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 162
LDI r2, 44
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (251, 208).
; PLAN: r0=251(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 208
LDI r2, 0x000000
PSET r0, r1, r2
HALT
