; DESCRIPTION: Draws a green line from (225, 237) to (403, 248).
; PLAN: r0=225(x1), r1=237(y1), r2=403(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 237
LDI r2, 403
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
