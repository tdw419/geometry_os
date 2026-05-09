; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (115, 17) to (215, 120). Then Places a cyan dot at position (5, 186).
; PLAN: r0=115(x1), r1=17(y1), r2=215(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=5(x), r1=186(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (115, 17) to (215, 120).
; PLAN: r0=115(x1), r1=17(y1), r2=215(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 17
LDI r2, 215
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (5, 186).
; PLAN: r0=5(x), r1=186(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 186
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
