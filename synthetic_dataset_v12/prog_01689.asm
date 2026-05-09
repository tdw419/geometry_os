; DESCRIPTION: Draws a orange line from (115, 242) to (148, 183).
; PLAN: r0=115(x1), r1=242(y1), r2=148(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 242
LDI r2, 148
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
