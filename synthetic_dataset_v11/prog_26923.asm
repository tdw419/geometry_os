; DESCRIPTION: Draws a cyan line from (127, 26) to (129, 223).
; PLAN: r0=127(x1), r1=26(y1), r2=129(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 26
LDI r2, 129
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
