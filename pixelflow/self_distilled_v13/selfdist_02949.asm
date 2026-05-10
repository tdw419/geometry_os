; DESCRIPTION: Draws a cyan line from (159, 86) to (52, 38).
; PLAN: r0=159(x1), r1=86(y1), r2=52(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 86
LDI r2, 52
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
