; DESCRIPTION: Draws a cyan line from (240, 48) to (232, 182).
; PLAN: r0=240(x1), r1=48(y1), r2=232(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 48
LDI r2, 232
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
