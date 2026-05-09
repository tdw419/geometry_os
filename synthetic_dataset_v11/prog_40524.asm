; DESCRIPTION: Draws a cyan line from (170, 172) to (212, 187).
; PLAN: r0=170(x1), r1=172(y1), r2=212(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 172
LDI r2, 212
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
