; DESCRIPTION: Draws a cyan line from (240, 157) to (115, 137).
; PLAN: r0=240(x1), r1=157(y1), r2=115(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 157
LDI r2, 115
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
