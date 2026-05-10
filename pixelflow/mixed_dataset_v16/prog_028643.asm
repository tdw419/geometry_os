; DESCRIPTION: Draws a cyan line from (61, 159) to (368, 15).
; PLAN: r0=61(x1), r1=159(y1), r2=368(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 159
LDI r2, 368
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
