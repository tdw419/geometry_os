; DESCRIPTION: Composite: . Then Renders a yellow line between points (168, 91) and (90, 194). Then Sets a single red pixel at (182, 8).
; PLAN: r0=168(x1), r1=91(y1), r2=90(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=182(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (168, 91) and (90, 194).
; PLAN: r0=168(x1), r1=91(y1), r2=90(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 91
LDI r2, 90
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (182, 8).
; PLAN: r0=182(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 8
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
