; DESCRIPTION: Draws a cyan line from (120, 172) to (252, 89).
; PLAN: r0=120(x1), r1=172(y1), r2=252(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 172
LDI r2, 252
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
