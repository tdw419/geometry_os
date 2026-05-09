; DESCRIPTION: Draws a cyan line from (359, 117) to (506, 7).
; PLAN: r0=359(x1), r1=117(y1), r2=506(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 117
LDI r2, 506
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
