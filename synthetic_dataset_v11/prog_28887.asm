; DESCRIPTION: Draws a cyan line from (60, 114) to (182, 211).
; PLAN: r0=60(x1), r1=114(y1), r2=182(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 114
LDI r2, 182
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
