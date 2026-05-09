; DESCRIPTION: Draws a yellow line from (210, 220) to (184, 16).
; PLAN: r0=210(x1), r1=220(y1), r2=184(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 220
LDI r2, 184
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
