; DESCRIPTION: Places a black line segment connecting (248, 249) to (215, 86).
; PLAN: r0=248(x1), r1=249(y1), r2=215(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 249
LDI r2, 215
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
