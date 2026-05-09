; DESCRIPTION: Draws a cyan line from (148, 211) to (167, 10).
; PLAN: r0=148(x1), r1=211(y1), r2=167(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 211
LDI r2, 167
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
