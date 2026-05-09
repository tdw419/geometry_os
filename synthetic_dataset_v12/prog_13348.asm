; DESCRIPTION: Draws a cyan line from (174, 106) to (46, 223).
; PLAN: r0=174(x1), r1=106(y1), r2=46(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 106
LDI r2, 46
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
