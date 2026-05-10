; DESCRIPTION: Draws a cyan line from (315, 246) to (422, 92).
; PLAN: r0=315(x1), r1=246(y1), r2=422(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 246
LDI r2, 422
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
