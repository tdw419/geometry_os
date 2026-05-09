; DESCRIPTION: Draws a cyan line from (241, 60) to (175, 75).
; PLAN: r0=241(x1), r1=60(y1), r2=175(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 60
LDI r2, 175
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
