; DESCRIPTION: Draws a white line from (277, 179) to (242, 94).
; PLAN: r0=277(x1), r1=179(y1), r2=242(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 179
LDI r2, 242
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
