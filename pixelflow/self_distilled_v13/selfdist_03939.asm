; DESCRIPTION: Draws a magenta line from (179, 172) to (365, 125).
; PLAN: r0=179(x1), r1=172(y1), r2=365(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 172
LDI r2, 365
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
