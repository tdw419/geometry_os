; DESCRIPTION: Draws a cyan line from (51, 159) to (126, 133).
; PLAN: r0=51(x1), r1=159(y1), r2=126(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 159
LDI r2, 126
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
