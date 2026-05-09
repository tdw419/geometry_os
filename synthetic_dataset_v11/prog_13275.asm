; DESCRIPTION: Composite: . Then Places a black line segment connecting (128, 146) to (6, 197). Then Sets a single yellow pixel at (187, 168).
; PLAN: r0=128(x1), r1=146(y1), r2=6(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=187(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (128, 146) to (6, 197).
; PLAN: r0=128(x1), r1=146(y1), r2=6(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 146
LDI r2, 6
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (187, 168).
; PLAN: r0=187(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
