; DESCRIPTION: Draws a green line from (170, 180) to (410, 140).
; PLAN: r0=170(x1), r1=180(y1), r2=410(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 180
LDI r2, 410
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
