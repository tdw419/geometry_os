; DESCRIPTION: Draws a cyan line from (56, 178) to (269, 138).
; PLAN: r0=56(x1), r1=178(y1), r2=269(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 178
LDI r2, 269
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
