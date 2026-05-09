; DESCRIPTION: Draws a cyan line from (70, 60) to (208, 188).
; PLAN: r0=70(x1), r1=60(y1), r2=208(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 60
LDI r2, 208
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
