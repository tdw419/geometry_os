; DESCRIPTION: Draws a yellow line from (446, 231) to (261, 93).
; PLAN: r0=446(x1), r1=231(y1), r2=261(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 231
LDI r2, 261
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
