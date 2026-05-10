; DESCRIPTION: Draws a cyan line from (287, 85) to (394, 25).
; PLAN: r0=287(x1), r1=85(y1), r2=394(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 85
LDI r2, 394
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
