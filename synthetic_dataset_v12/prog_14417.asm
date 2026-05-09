; DESCRIPTION: Draws a green line from (228, 126) to (283, 97).
; PLAN: r0=228(x1), r1=126(y1), r2=283(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 126
LDI r2, 283
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
