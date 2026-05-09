; DESCRIPTION: Draws a green line from (117, 214) to (470, 247).
; PLAN: r0=117(x1), r1=214(y1), r2=470(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 214
LDI r2, 470
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
