; DESCRIPTION: Draws a yellow line from (346, 18) to (343, 195).
; PLAN: r0=346(x1), r1=18(y1), r2=343(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 18
LDI r2, 343
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
