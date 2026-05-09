; DESCRIPTION: Composite: . Then Draws a black line from (248, 158) to (123, 223). Then Places a orange dot at position (95, 250).
; PLAN: r0=248(x1), r1=158(y1), r2=123(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (248, 158) to (123, 223).
; PLAN: r0=248(x1), r1=158(y1), r2=123(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 158
LDI r2, 123
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (95, 250).
; PLAN: r0=95(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 250
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
