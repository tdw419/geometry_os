; DESCRIPTION: Draws a cyan line from (50, 138) to (129, 231).
; PLAN: r0=50(x1), r1=138(y1), r2=129(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 138
LDI r2, 129
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
