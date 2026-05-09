; DESCRIPTION: Draws a cyan line from (166, 186) to (227, 102).
; PLAN: r0=166(x1), r1=186(y1), r2=227(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 186
LDI r2, 227
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
