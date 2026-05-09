; DESCRIPTION: Composite: . Then Draws a green line from (42, 115) to (13, 197). Then Places a orange dot at position (191, 58).
; PLAN: r0=42(x1), r1=115(y1), r2=13(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=191(x), r1=58(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (42, 115) to (13, 197).
; PLAN: r0=42(x1), r1=115(y1), r2=13(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 115
LDI r2, 13
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (191, 58).
; PLAN: r0=191(x), r1=58(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 58
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
