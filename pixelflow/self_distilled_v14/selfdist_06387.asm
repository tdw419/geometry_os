; DESCRIPTION: Draws a green line from (50, 194) to (215, 36).
; PLAN: r0=50(x1), r1=194(y1), r2=215(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 194
LDI r2, 215
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
