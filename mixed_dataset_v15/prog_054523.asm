; DESCRIPTION: Draws a cyan line from (187, 172) to (377, 72).
; PLAN: r0=187(x1), r1=172(y1), r2=377(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 172
LDI r2, 377
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
