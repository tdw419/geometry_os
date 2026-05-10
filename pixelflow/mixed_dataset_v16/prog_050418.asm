; DESCRIPTION: Draws a cyan line from (401, 91) to (122, 110).
; PLAN: r0=401(x1), r1=91(y1), r2=122(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 91
LDI r2, 122
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
