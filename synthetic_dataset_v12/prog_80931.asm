; DESCRIPTION: Draws a cyan line from (5, 248) to (99, 60).
; PLAN: r0=5(x1), r1=248(y1), r2=99(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 248
LDI r2, 99
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
