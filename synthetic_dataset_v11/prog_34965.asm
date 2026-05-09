; DESCRIPTION: Draws a cyan line from (254, 28) to (139, 84).
; PLAN: r0=254(x1), r1=28(y1), r2=139(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 28
LDI r2, 139
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
