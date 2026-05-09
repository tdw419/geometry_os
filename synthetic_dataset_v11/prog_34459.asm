; DESCRIPTION: Draws a white line from (216, 194) to (31, 228).
; PLAN: r0=216(x1), r1=194(y1), r2=31(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 194
LDI r2, 31
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
