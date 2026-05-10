; DESCRIPTION: Draws a cyan line from (22, 224) to (361, 92).
; PLAN: r0=22(x1), r1=224(y1), r2=361(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 224
LDI r2, 361
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
