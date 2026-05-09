; DESCRIPTION: Composite: . Then Draws a yellow line from (206, 233) to (15, 208). Then Places a green dot at position (240, 220).
; PLAN: r0=206(x1), r1=233(y1), r2=15(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=240(x), r1=220(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (206, 233) to (15, 208).
; PLAN: r0=206(x1), r1=233(y1), r2=15(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 233
LDI r2, 15
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (240, 220).
; PLAN: r0=240(x), r1=220(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 220
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
