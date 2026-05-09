; DESCRIPTION: Draws a cyan line from (95, 202) to (50, 211).
; PLAN: r0=95(x1), r1=202(y1), r2=50(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 202
LDI r2, 50
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
