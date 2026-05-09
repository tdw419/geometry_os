; DESCRIPTION: Draws a cyan line from (125, 204) to (191, 92).
; PLAN: r0=125(x1), r1=204(y1), r2=191(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 204
LDI r2, 191
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
