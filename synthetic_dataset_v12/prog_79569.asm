; DESCRIPTION: Renders a cyan line between points (469, 187) and (35, 44).
; PLAN: r0=469(x1), r1=187(y1), r2=35(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 187
LDI r2, 35
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
