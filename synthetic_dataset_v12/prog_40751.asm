; DESCRIPTION: Draws a white line from (297, 161) to (257, 40).
; PLAN: r0=297(x1), r1=161(y1), r2=257(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 161
LDI r2, 257
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
