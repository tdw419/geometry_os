; DESCRIPTION: Draws a green line from (398, 21) to (486, 81).
; PLAN: r0=398(x1), r1=21(y1), r2=486(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 21
LDI r2, 486
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
