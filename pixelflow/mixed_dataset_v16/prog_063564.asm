; DESCRIPTION: Draws a cyan line from (386, 252) to (6, 172).
; PLAN: r0=386(x1), r1=252(y1), r2=6(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 252
LDI r2, 6
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
