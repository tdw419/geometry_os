; DESCRIPTION: Composite: . Then Places a green dot at position (199, 155). Then Draws a green line from (70, 13) to (108, 20).
; PLAN: r0=199(x), r1=155(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=70(x1), r1=13(y1), r2=108(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (199, 155).
; PLAN: r0=199(x), r1=155(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 155
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (70, 13) to (108, 20).
; PLAN: r0=70(x1), r1=13(y1), r2=108(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 13
LDI r2, 108
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
