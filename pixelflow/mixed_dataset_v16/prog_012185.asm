; DESCRIPTION: Draws a black line from (259, 143) to (187, 209).
; PLAN: r0=259(x1), r1=143(y1), r2=187(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 143
LDI r2, 187
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
