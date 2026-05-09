; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (154, 59). Then Renders a purple line between points (183, 45) and (222, 148).
; PLAN: r0=154(x), r1=59(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=183(x1), r1=45(y1), r2=222(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (154, 59).
; PLAN: r0=154(x), r1=59(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 59
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (183, 45) and (222, 148).
; PLAN: r0=183(x1), r1=45(y1), r2=222(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 45
LDI r2, 222
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
