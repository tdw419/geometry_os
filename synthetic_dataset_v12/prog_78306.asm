; DESCRIPTION: Draws a yellow line from (71, 251) to (410, 134).
; PLAN: r0=71(x1), r1=251(y1), r2=410(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 251
LDI r2, 410
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
