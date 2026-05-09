; DESCRIPTION: Draws a cyan line from (175, 221) to (106, 51).
; PLAN: r0=175(x1), r1=221(y1), r2=106(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 221
LDI r2, 106
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
