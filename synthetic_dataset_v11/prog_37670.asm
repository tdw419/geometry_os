; DESCRIPTION: Composite: . Then Renders a yellow line between points (144, 33) and (174, 74). Then Sets a single orange pixel at (190, 127).
; PLAN: r0=144(x1), r1=33(y1), r2=174(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=190(x), r1=127(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (144, 33) and (174, 74).
; PLAN: r0=144(x1), r1=33(y1), r2=174(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 33
LDI r2, 174
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (190, 127).
; PLAN: r0=190(x), r1=127(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 127
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
