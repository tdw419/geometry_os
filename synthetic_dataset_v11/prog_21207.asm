; DESCRIPTION: Draws a cyan line from (248, 123) to (175, 174).
; PLAN: r0=248(x1), r1=123(y1), r2=175(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 123
LDI r2, 175
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
