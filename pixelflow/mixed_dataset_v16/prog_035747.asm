; DESCRIPTION: Draws a green line from (228, 175) to (105, 87).
; PLAN: r0=228(x1), r1=175(y1), r2=105(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 175
LDI r2, 105
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
