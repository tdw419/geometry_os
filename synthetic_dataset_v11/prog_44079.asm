; DESCRIPTION: Draws a cyan line from (164, 222) to (136, 40).
; PLAN: r0=164(x1), r1=222(y1), r2=136(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 222
LDI r2, 136
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
