; DESCRIPTION: Draws a magenta line from (265, 70) to (281, 142).
; PLAN: r0=265(x1), r1=70(y1), r2=281(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 70
LDI r2, 281
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
