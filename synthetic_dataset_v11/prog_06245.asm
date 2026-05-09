; DESCRIPTION: Composite: . Then Renders a red line between points (242, 108) and (216, 243). Then Sets a single purple pixel at (13, 71).
; PLAN: r0=242(x1), r1=108(y1), r2=216(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=13(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (242, 108) and (216, 243).
; PLAN: r0=242(x1), r1=108(y1), r2=216(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 108
LDI r2, 216
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (13, 71).
; PLAN: r0=13(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
