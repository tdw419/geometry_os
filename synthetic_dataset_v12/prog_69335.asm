; DESCRIPTION: Draws a yellow line from (109, 215) to (197, 48).
; PLAN: r0=109(x1), r1=215(y1), r2=197(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 215
LDI r2, 197
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
