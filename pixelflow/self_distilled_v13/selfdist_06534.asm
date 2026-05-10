; DESCRIPTION: Draws a yellow line from (290, 32) to (215, 48).
; PLAN: r0=290(x1), r1=32(y1), r2=215(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 32
LDI r2, 215
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
