; DESCRIPTION: Composite: . Then Places a red dot at position (126, 215). Then Creates a cyan circular shape at (229, 220) with radius 25.
; PLAN: r0=126(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=229(x), r1=220(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (126, 215).
; PLAN: r0=126(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 215
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan circular shape at (229, 220) with radius 25.
; PLAN: r0=229(x), r1=220(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 220
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
