; DESCRIPTION: Draws a green line from (90, 151) to (425, 247).
; PLAN: r0=90(x1), r1=151(y1), r2=425(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 151
LDI r2, 425
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
