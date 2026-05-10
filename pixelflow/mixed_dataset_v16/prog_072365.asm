; DESCRIPTION: Draws a cyan line from (359, 151) to (98, 17).
; PLAN: r0=359(x1), r1=151(y1), r2=98(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 151
LDI r2, 98
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
