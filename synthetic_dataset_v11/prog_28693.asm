; DESCRIPTION: Composite: . Then Places a green dot at position (77, 202). Then Draws a red line from (73, 20) to (170, 176).
; PLAN: r0=77(x), r1=202(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=73(x1), r1=20(y1), r2=170(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (77, 202).
; PLAN: r0=77(x), r1=202(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 202
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (73, 20) to (170, 176).
; PLAN: r0=73(x1), r1=20(y1), r2=170(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 20
LDI r2, 170
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
