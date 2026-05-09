; DESCRIPTION: Draws a white line from (243, 192) to (391, 214).
; PLAN: r0=243(x1), r1=192(y1), r2=391(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 192
LDI r2, 391
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
