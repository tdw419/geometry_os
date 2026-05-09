; DESCRIPTION: Composite: . Then Places a cyan dot at position (183, 253). Then Draws a yellow line from (124, 3) to (153, 107).
; PLAN: r0=183(x), r1=253(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=124(x1), r1=3(y1), r2=153(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (183, 253).
; PLAN: r0=183(x), r1=253(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 253
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (124, 3) to (153, 107).
; PLAN: r0=124(x1), r1=3(y1), r2=153(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 3
LDI r2, 153
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
