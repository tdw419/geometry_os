; DESCRIPTION: Draws a cyan line from (154, 138) to (13, 81).
; PLAN: r0=154(x1), r1=138(y1), r2=13(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 138
LDI r2, 13
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
