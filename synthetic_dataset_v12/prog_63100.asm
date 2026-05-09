; DESCRIPTION: Draws a cyan line from (470, 6) to (47, 168).
; PLAN: r0=470(x1), r1=6(y1), r2=47(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 6
LDI r2, 47
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
