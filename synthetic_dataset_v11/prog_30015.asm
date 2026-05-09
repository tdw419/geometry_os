; DESCRIPTION: Draws a green line from (247, 21) to (196, 246).
; PLAN: r0=247(x1), r1=21(y1), r2=196(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 21
LDI r2, 196
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
