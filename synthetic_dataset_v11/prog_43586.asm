; DESCRIPTION: Draws a cyan line from (71, 51) to (226, 23).
; PLAN: r0=71(x1), r1=51(y1), r2=226(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 51
LDI r2, 226
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
