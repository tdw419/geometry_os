; DESCRIPTION: Draws a white line from (33, 51) to (39, 225).
; PLAN: r0=33(x1), r1=51(y1), r2=39(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 51
LDI r2, 39
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
