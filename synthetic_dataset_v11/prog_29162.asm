; DESCRIPTION: Draws a cyan line from (251, 222) to (187, 131).
; PLAN: r0=251(x1), r1=222(y1), r2=187(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 222
LDI r2, 187
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
