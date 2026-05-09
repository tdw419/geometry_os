; DESCRIPTION: Draws a cyan line from (207, 187) to (230, 72).
; PLAN: r0=207(x1), r1=187(y1), r2=230(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 187
LDI r2, 230
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
