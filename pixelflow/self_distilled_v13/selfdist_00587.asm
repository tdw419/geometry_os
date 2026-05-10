; DESCRIPTION: Draws a cyan line from (271, 105) to (280, 156).
; PLAN: r0=271(x1), r1=105(y1), r2=280(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 105
LDI r2, 280
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
