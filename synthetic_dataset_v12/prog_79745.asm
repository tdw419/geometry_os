; DESCRIPTION: Draws a white line from (210, 74) to (257, 28).
; PLAN: r0=210(x1), r1=74(y1), r2=257(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 74
LDI r2, 257
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
