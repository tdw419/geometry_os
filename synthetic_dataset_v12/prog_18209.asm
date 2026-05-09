; DESCRIPTION: Draws a cyan line from (494, 10) to (208, 104).
; PLAN: r0=494(x1), r1=10(y1), r2=208(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 10
LDI r2, 208
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
