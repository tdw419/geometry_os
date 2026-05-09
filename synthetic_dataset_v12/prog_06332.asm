; DESCRIPTION: Draws a black line from (187, 117) to (61, 32).
; PLAN: r0=187(x1), r1=117(y1), r2=61(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 117
LDI r2, 61
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
