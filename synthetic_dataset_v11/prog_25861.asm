; DESCRIPTION: Composite: . Then Places a orange dot at position (146, 148). Then Draws a yellow line from (14, 176) to (194, 253).
; PLAN: r0=146(x), r1=148(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=14(x1), r1=176(y1), r2=194(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (146, 148).
; PLAN: r0=146(x), r1=148(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 148
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (14, 176) to (194, 253).
; PLAN: r0=14(x1), r1=176(y1), r2=194(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 176
LDI r2, 194
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
