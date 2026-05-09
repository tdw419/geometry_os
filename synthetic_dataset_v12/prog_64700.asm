; DESCRIPTION: Draws a green line from (50, 176) to (309, 225).
; PLAN: r0=50(x1), r1=176(y1), r2=309(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 176
LDI r2, 309
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
