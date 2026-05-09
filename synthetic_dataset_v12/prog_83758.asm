; DESCRIPTION: Draws a cyan line from (257, 227) to (484, 220).
; PLAN: r0=257(x1), r1=227(y1), r2=484(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 227
LDI r2, 484
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
