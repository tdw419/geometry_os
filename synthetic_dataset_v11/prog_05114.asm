; DESCRIPTION: Draws a green line from (91, 18) to (25, 93).
; PLAN: r0=91(x1), r1=18(y1), r2=25(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 18
LDI r2, 25
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
