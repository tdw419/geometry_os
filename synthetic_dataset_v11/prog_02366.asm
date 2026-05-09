; DESCRIPTION: Places a cyan line segment connecting (82, 109) to (44, 114).
; PLAN: r0=82(x1), r1=109(y1), r2=44(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 109
LDI r2, 44
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
