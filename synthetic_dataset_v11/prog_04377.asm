; DESCRIPTION: Draws a magenta line from (180, 228) to (251, 122).
; PLAN: r0=180(x1), r1=228(y1), r2=251(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 228
LDI r2, 251
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
