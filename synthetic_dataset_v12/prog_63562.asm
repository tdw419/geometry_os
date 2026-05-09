; DESCRIPTION: Draws a cyan line from (495, 37) to (251, 219).
; PLAN: r0=495(x1), r1=37(y1), r2=251(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 37
LDI r2, 251
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
