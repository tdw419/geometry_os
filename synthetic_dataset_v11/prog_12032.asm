; DESCRIPTION: Composite: . Then Places a orange circle of radius 44 at center (127, 187). Then Sets a single purple pixel at (146, 133).
; PLAN: r0=127(x), r1=187(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=146(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange circle of radius 44 at center (127, 187).
; PLAN: r0=127(x), r1=187(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 187
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (146, 133).
; PLAN: r0=146(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 133
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
