; DESCRIPTION: Draws a cyan line from (382, 113) to (302, 231).
; PLAN: r0=382(x1), r1=113(y1), r2=302(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 113
LDI r2, 302
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
