; DESCRIPTION: Draws a cyan line from (386, 41) to (385, 65).
; PLAN: r0=386(x1), r1=41(y1), r2=385(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 41
LDI r2, 385
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
