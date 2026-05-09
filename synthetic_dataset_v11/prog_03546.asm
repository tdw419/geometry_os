; DESCRIPTION: Draws a magenta line from (4, 221) to (180, 223).
; PLAN: r0=4(x1), r1=221(y1), r2=180(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 221
LDI r2, 180
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
