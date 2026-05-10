; DESCRIPTION: Draws a cyan line from (174, 114) to (184, 54).
; PLAN: r0=174(x1), r1=114(y1), r2=184(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 114
LDI r2, 184
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
