; DESCRIPTION: Draws a cyan line from (288, 85) to (416, 161).
; PLAN: r0=288(x1), r1=85(y1), r2=416(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 85
LDI r2, 416
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
