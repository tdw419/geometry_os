; DESCRIPTION: Composite: . Then Draws a yellow line from (182, 174) to (185, 49). Then Places a green dot at position (9, 29).
; PLAN: r0=182(x1), r1=174(y1), r2=185(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=9(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (182, 174) to (185, 49).
; PLAN: r0=182(x1), r1=174(y1), r2=185(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 174
LDI r2, 185
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (9, 29).
; PLAN: r0=9(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 29
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
