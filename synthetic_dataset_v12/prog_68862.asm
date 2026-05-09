; DESCRIPTION: Draws a cyan line from (130, 180) to (375, 121).
; PLAN: r0=130(x1), r1=180(y1), r2=375(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 180
LDI r2, 375
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
