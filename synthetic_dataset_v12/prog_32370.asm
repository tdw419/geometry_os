; DESCRIPTION: Draws a yellow line from (160, 58) to (346, 82).
; PLAN: r0=160(x1), r1=58(y1), r2=346(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 58
LDI r2, 346
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
