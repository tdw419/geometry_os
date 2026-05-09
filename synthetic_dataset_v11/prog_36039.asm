; DESCRIPTION: Draws a cyan line from (134, 197) to (141, 96).
; PLAN: r0=134(x1), r1=197(y1), r2=141(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 197
LDI r2, 141
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
