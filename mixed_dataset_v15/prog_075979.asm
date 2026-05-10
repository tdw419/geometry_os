; DESCRIPTION: Draws a white line from (16, 238) to (391, 196).
; PLAN: r0=16(x1), r1=238(y1), r2=391(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 238
LDI r2, 391
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
