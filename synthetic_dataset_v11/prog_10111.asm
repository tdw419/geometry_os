; DESCRIPTION: Draws a purple line from (215, 193) to (178, 55).
; PLAN: r0=215(x1), r1=193(y1), r2=178(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 193
LDI r2, 178
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
