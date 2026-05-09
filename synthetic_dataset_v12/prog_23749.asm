; DESCRIPTION: Draws a cyan line from (471, 194) to (473, 246).
; PLAN: r0=471(x1), r1=194(y1), r2=473(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 194
LDI r2, 473
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
