; DESCRIPTION: Draws a cyan line from (273, 70) to (262, 252).
; PLAN: r0=273(x1), r1=70(y1), r2=262(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 70
LDI r2, 262
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
