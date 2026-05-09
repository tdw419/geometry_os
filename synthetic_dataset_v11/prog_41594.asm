; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (102, 170). Then Draws a yellow line from (83, 142) to (242, 164).
; PLAN: r0=102(x), r1=170(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=83(x1), r1=142(y1), r2=242(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (102, 170).
; PLAN: r0=102(x), r1=170(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 170
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (83, 142) to (242, 164).
; PLAN: r0=83(x1), r1=142(y1), r2=242(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 142
LDI r2, 242
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
