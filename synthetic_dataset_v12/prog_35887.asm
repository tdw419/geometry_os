; DESCRIPTION: Draws a magenta line from (193, 228) to (183, 94).
; PLAN: r0=193(x1), r1=228(y1), r2=183(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 228
LDI r2, 183
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
