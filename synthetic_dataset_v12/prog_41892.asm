; DESCRIPTION: Draws a cyan line from (89, 126) to (54, 127).
; PLAN: r0=89(x1), r1=126(y1), r2=54(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 126
LDI r2, 54
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
