; DESCRIPTION: Places a green line segment connecting (186, 237) to (213, 208).
; PLAN: r0=186(x1), r1=237(y1), r2=213(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 237
LDI r2, 213
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
