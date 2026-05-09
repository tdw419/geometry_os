; DESCRIPTION: Draws a cyan line from (179, 178) to (290, 172).
; PLAN: r0=179(x1), r1=178(y1), r2=290(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 178
LDI r2, 290
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
