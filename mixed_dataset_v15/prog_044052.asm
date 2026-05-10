; DESCRIPTION: Draws a cyan line from (385, 84) to (252, 63).
; PLAN: r0=385(x1), r1=84(y1), r2=252(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 84
LDI r2, 252
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
