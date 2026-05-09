; DESCRIPTION: Draws a yellow line from (24, 196) to (215, 5).
; PLAN: r0=24(x1), r1=196(y1), r2=215(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 196
LDI r2, 215
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
