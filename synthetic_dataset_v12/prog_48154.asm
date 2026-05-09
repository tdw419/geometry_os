; DESCRIPTION: Draws a green line from (215, 64) to (301, 158).
; PLAN: r0=215(x1), r1=64(y1), r2=301(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 64
LDI r2, 301
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
