; DESCRIPTION: Composite: . Then Renders a green line between points (231, 54) and (99, 171). Then Sets a single purple pixel at (217, 166).
; PLAN: r0=231(x1), r1=54(y1), r2=99(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=217(x), r1=166(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (231, 54) and (99, 171).
; PLAN: r0=231(x1), r1=54(y1), r2=99(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 54
LDI r2, 99
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (217, 166).
; PLAN: r0=217(x), r1=166(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 166
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
