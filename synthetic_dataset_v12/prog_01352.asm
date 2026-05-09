; DESCRIPTION: Draws a cyan line from (180, 91) to (395, 157).
; PLAN: r0=180(x1), r1=91(y1), r2=395(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 91
LDI r2, 395
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
