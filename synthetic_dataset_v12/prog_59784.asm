; DESCRIPTION: Draws a cyan line from (103, 14) to (443, 54).
; PLAN: r0=103(x1), r1=14(y1), r2=443(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 14
LDI r2, 443
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
