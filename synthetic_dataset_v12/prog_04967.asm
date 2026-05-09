; DESCRIPTION: Places a purple line segment connecting (197, 229) to (346, 198).
; PLAN: r0=197(x1), r1=229(y1), r2=346(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 229
LDI r2, 346
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
