; DESCRIPTION: Draws a green line from (71, 180) to (38, 126).
; PLAN: r0=71(x1), r1=180(y1), r2=38(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 180
LDI r2, 38
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
