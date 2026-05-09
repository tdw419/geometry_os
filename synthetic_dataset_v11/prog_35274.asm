; DESCRIPTION: Composite: . Then Draws a black line from (40, 38) to (221, 22). Then Places a cyan dot at position (94, 78).
; PLAN: r0=40(x1), r1=38(y1), r2=221(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=94(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (40, 38) to (221, 22).
; PLAN: r0=40(x1), r1=38(y1), r2=221(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 38
LDI r2, 221
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (94, 78).
; PLAN: r0=94(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
