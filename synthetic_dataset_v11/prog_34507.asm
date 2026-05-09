; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (66, 236). Then Creates a yellow circular shape at (208, 212) with radius 42.
; PLAN: r0=66(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=208(x), r1=212(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (66, 236).
; PLAN: r0=66(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 236
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (208, 212) with radius 42.
; PLAN: r0=208(x), r1=212(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 212
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
