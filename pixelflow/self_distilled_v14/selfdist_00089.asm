; DESCRIPTION: Draws a cyan line from (256, 113) to (83, 88).
; PLAN: r0=256(x1), r1=113(y1), r2=83(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 113
LDI r2, 83
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
