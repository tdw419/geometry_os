; DESCRIPTION: Draws a cyan line from (159, 70) to (204, 203).
; PLAN: r0=159(x1), r1=70(y1), r2=204(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 70
LDI r2, 204
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
