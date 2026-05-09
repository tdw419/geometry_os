; DESCRIPTION: Composite: . Then Sets a single orange pixel at (96, 228). Then Draws a cyan circle centered at (164, 168) with radius 44.
; PLAN: r0=96(x), r1=228(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=164(x), r1=168(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (96, 228).
; PLAN: r0=96(x), r1=228(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 228
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan circle centered at (164, 168) with radius 44.
; PLAN: r0=164(x), r1=168(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 168
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
