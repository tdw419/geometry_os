; DESCRIPTION: Composite: . Then Draws a orange line from (136, 76) to (181, 80). Then Places a cyan dot at position (9, 204).
; PLAN: r0=136(x1), r1=76(y1), r2=181(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=9(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (136, 76) to (181, 80).
; PLAN: r0=136(x1), r1=76(y1), r2=181(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 76
LDI r2, 181
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (9, 204).
; PLAN: r0=9(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 204
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
