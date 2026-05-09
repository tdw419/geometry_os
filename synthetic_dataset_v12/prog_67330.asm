; DESCRIPTION: Draws a orange line from (126, 74) to (202, 218).
; PLAN: r0=126(x1), r1=74(y1), r2=202(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 74
LDI r2, 202
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
