; DESCRIPTION: Draws a cyan line from (453, 117) to (428, 247).
; PLAN: r0=453(x1), r1=117(y1), r2=428(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 117
LDI r2, 428
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
