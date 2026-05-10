; DESCRIPTION: Draws a cyan line from (455, 236) to (400, 149).
; PLAN: r0=455(x1), r1=236(y1), r2=400(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 236
LDI r2, 400
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
