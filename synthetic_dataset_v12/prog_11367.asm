; DESCRIPTION: Places a yellow line segment connecting (425, 199) to (361, 125).
; PLAN: r0=425(x1), r1=199(y1), r2=361(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 199
LDI r2, 361
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
