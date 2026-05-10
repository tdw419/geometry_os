; DESCRIPTION: Draws a cyan line from (368, 207) to (377, 171).
; PLAN: r0=368(x1), r1=207(y1), r2=377(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 207
LDI r2, 377
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
