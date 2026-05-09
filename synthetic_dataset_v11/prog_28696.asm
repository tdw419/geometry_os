; DESCRIPTION: Draws a white line from (126, 52) to (170, 197).
; PLAN: r0=126(x1), r1=52(y1), r2=170(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 52
LDI r2, 170
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
