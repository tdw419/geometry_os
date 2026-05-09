; DESCRIPTION: Composite: . Then Renders a orange line between points (227, 129) and (61, 220). Then Places a cyan dot at position (94, 25).
; PLAN: r0=227(x1), r1=129(y1), r2=61(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=94(x), r1=25(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (227, 129) and (61, 220).
; PLAN: r0=227(x1), r1=129(y1), r2=61(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 129
LDI r2, 61
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (94, 25).
; PLAN: r0=94(x), r1=25(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 25
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
