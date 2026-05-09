; DESCRIPTION: Composite: . Then Sets a single purple pixel at (142, 238). Then Draws a cyan line from (221, 94) to (242, 76).
; PLAN: r0=142(x), r1=238(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=221(x1), r1=94(y1), r2=242(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (142, 238).
; PLAN: r0=142(x), r1=238(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 238
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (221, 94) to (242, 76).
; PLAN: r0=221(x1), r1=94(y1), r2=242(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 94
LDI r2, 242
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
