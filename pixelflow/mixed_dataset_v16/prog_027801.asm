; DESCRIPTION: Draws a cyan line from (331, 55) to (24, 114).
; PLAN: r0=331(x1), r1=55(y1), r2=24(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 55
LDI r2, 24
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
