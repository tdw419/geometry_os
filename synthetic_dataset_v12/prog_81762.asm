; DESCRIPTION: Draws a yellow line from (502, 157) to (120, 134).
; PLAN: r0=502(x1), r1=157(y1), r2=120(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 157
LDI r2, 120
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
