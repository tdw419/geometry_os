; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (123, 63). Then Draws a green line from (237, 134) to (207, 210).
; PLAN: r0=123(x), r1=63(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=237(x1), r1=134(y1), r2=207(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (123, 63).
; PLAN: r0=123(x), r1=63(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 63
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (237, 134) to (207, 210).
; PLAN: r0=237(x1), r1=134(y1), r2=207(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 134
LDI r2, 207
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
