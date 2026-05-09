; DESCRIPTION: Draws a cyan line from (141, 225) to (151, 53).
; PLAN: r0=141(x1), r1=225(y1), r2=151(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 225
LDI r2, 151
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
