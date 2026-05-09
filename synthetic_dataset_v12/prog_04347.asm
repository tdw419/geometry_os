; DESCRIPTION: Draws a cyan line from (495, 224) to (246, 217).
; PLAN: r0=495(x1), r1=224(y1), r2=246(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 224
LDI r2, 246
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
