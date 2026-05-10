; DESCRIPTION: Draws a cyan line from (205, 6) to (72, 103).
; PLAN: r0=205(x1), r1=6(y1), r2=72(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 6
LDI r2, 72
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
