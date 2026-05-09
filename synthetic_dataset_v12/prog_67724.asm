; DESCRIPTION: Draws a cyan line from (160, 159) to (425, 180).
; PLAN: r0=160(x1), r1=159(y1), r2=425(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 159
LDI r2, 425
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
