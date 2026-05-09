; DESCRIPTION: Draws a red line from (241, 150) to (215, 63).
; PLAN: r0=241(x1), r1=150(y1), r2=215(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 150
LDI r2, 215
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
