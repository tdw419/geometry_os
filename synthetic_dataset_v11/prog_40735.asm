; DESCRIPTION: Draws a green line from (209, 246) to (79, 221).
; PLAN: r0=209(x1), r1=246(y1), r2=79(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 246
LDI r2, 79
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
