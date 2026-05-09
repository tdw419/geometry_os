; DESCRIPTION: Draws a green line from (189, 5) to (113, 204).
; PLAN: r0=189(x1), r1=5(y1), r2=113(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 5
LDI r2, 113
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
