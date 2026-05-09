; DESCRIPTION: Draws a yellow line from (435, 126) to (330, 236).
; PLAN: r0=435(x1), r1=126(y1), r2=330(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 126
LDI r2, 330
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
