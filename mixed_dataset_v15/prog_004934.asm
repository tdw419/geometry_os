; DESCRIPTION: Draws a red line from (326, 231) to (246, 71).
; PLAN: r0=326(x1), r1=231(y1), r2=246(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 231
LDI r2, 246
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
