; DESCRIPTION: Composite: . Then Places a blue dot at position (68, 232). Then Draws a red line from (46, 35) to (146, 103).
; PLAN: r0=68(x), r1=232(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=46(x1), r1=35(y1), r2=146(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (68, 232).
; PLAN: r0=68(x), r1=232(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 232
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (46, 35) to (146, 103).
; PLAN: r0=46(x1), r1=35(y1), r2=146(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 35
LDI r2, 146
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
