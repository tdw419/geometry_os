; DESCRIPTION: Draws a cyan line from (160, 119) to (30, 53).
; PLAN: r0=160(x1), r1=119(y1), r2=30(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 119
LDI r2, 30
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
