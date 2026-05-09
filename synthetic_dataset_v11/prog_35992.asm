; DESCRIPTION: Draws a cyan line from (110, 235) to (55, 53).
; PLAN: r0=110(x1), r1=235(y1), r2=55(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 235
LDI r2, 55
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
