; DESCRIPTION: Draws a cyan line from (454, 246) to (280, 98).
; PLAN: r0=454(x1), r1=246(y1), r2=280(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 246
LDI r2, 280
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
