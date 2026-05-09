; DESCRIPTION: Draws a cyan line from (361, 114) to (77, 162).
; PLAN: r0=361(x1), r1=114(y1), r2=77(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 114
LDI r2, 77
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
