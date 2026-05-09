; DESCRIPTION: Composite: . Then Draws a blue line from (117, 185) to (34, 30). Then Places a yellow dot at position (187, 184).
; PLAN: r0=117(x1), r1=185(y1), r2=34(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=187(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (117, 185) to (34, 30).
; PLAN: r0=117(x1), r1=185(y1), r2=34(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 185
LDI r2, 34
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (187, 184).
; PLAN: r0=187(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 184
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
