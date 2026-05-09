; DESCRIPTION: Draws a cyan line from (107, 249) to (148, 40).
; PLAN: r0=107(x1), r1=249(y1), r2=148(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 249
LDI r2, 148
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
