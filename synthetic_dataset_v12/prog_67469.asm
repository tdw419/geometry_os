; DESCRIPTION: Draws a cyan line from (182, 95) to (368, 249).
; PLAN: r0=182(x1), r1=95(y1), r2=368(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 95
LDI r2, 368
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
