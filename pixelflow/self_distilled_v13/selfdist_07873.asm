; DESCRIPTION: Draws a cyan line from (383, 105) to (152, 114).
; PLAN: r0=383(x1), r1=105(y1), r2=152(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 105
LDI r2, 152
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
