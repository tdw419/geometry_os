; DESCRIPTION: Composite: . Then Draws a purple line from (166, 88) to (213, 40). Then Places a orange dot at position (16, 249).
; PLAN: r0=166(x1), r1=88(y1), r2=213(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=16(x), r1=249(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (166, 88) to (213, 40).
; PLAN: r0=166(x1), r1=88(y1), r2=213(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 88
LDI r2, 213
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (16, 249).
; PLAN: r0=16(x), r1=249(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 249
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
