; DESCRIPTION: Draws a cyan line from (72, 62) to (65, 87).
; PLAN: r0=72(x1), r1=62(y1), r2=65(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 62
LDI r2, 65
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
