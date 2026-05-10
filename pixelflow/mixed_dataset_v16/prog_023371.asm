; DESCRIPTION: Draws a cyan line from (230, 81) to (53, 115).
; PLAN: r0=230(x1), r1=81(y1), r2=53(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 81
LDI r2, 53
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
