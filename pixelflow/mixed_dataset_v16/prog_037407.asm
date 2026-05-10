; DESCRIPTION: Draws a cyan line from (200, 163) to (104, 56).
; PLAN: r0=200(x1), r1=163(y1), r2=104(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 163
LDI r2, 104
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
