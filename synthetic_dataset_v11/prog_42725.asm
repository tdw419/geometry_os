; DESCRIPTION: Composite: . Then Places a black dot at position (108, 41). Then Renders a green line between points (175, 62) and (187, 150).
; PLAN: r0=108(x), r1=41(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=175(x1), r1=62(y1), r2=187(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (108, 41).
; PLAN: r0=108(x), r1=41(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 41
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a green line between points (175, 62) and (187, 150).
; PLAN: r0=175(x1), r1=62(y1), r2=187(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 62
LDI r2, 187
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
