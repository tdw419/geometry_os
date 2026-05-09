; DESCRIPTION: Draws a cyan line from (468, 198) to (401, 60).
; PLAN: r0=468(x1), r1=198(y1), r2=401(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 198
LDI r2, 401
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
