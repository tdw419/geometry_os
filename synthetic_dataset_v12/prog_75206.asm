; DESCRIPTION: Draws a cyan line from (350, 226) to (130, 35).
; PLAN: r0=350(x1), r1=226(y1), r2=130(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 226
LDI r2, 130
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
