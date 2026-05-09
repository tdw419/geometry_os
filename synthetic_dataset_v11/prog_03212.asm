; DESCRIPTION: Draws a purple line from (18, 50) to (12, 27).
; PLAN: r0=18(x1), r1=50(y1), r2=12(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 50
LDI r2, 12
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
