; DESCRIPTION: Draws a cyan line from (456, 45) to (310, 133).
; PLAN: r0=456(x1), r1=45(y1), r2=310(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 45
LDI r2, 310
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
