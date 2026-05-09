; DESCRIPTION: Draws a cyan line from (240, 24) to (159, 18).
; PLAN: r0=240(x1), r1=24(y1), r2=159(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 24
LDI r2, 159
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
