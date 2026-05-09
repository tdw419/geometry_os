; DESCRIPTION: Draws a cyan line from (501, 60) to (359, 30).
; PLAN: r0=501(x1), r1=60(y1), r2=359(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 60
LDI r2, 359
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
