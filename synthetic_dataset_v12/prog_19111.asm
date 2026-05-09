; DESCRIPTION: Draws a green line from (232, 103) to (488, 236).
; PLAN: r0=232(x1), r1=103(y1), r2=488(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 103
LDI r2, 488
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
