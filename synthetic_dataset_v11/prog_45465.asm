; DESCRIPTION: Draws a cyan line from (174, 36) to (191, 91).
; PLAN: r0=174(x1), r1=36(y1), r2=191(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 36
LDI r2, 191
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
