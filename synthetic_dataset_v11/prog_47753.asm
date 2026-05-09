; DESCRIPTION: Draws a magenta line from (180, 167) to (215, 199).
; PLAN: r0=180(x1), r1=167(y1), r2=215(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 167
LDI r2, 215
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
