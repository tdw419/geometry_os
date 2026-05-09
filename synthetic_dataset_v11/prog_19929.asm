; DESCRIPTION: Composite: . Then Places a yellow dot at position (137, 210). Then Draws a cyan line from (3, 40) to (188, 233).
; PLAN: r0=137(x), r1=210(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=3(x1), r1=40(y1), r2=188(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (137, 210).
; PLAN: r0=137(x), r1=210(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 210
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (3, 40) to (188, 233).
; PLAN: r0=3(x1), r1=40(y1), r2=188(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 40
LDI r2, 188
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
