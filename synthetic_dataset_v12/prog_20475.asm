; DESCRIPTION: Draws a cyan line from (418, 0) to (75, 187).
; PLAN: r0=418(x1), r1=0(y1), r2=75(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 0
LDI r2, 75
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
