; DESCRIPTION: Draws a cyan line from (361, 1) to (371, 60).
; PLAN: r0=361(x1), r1=1(y1), r2=371(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 1
LDI r2, 371
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
