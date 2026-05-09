; DESCRIPTION: Draws a white line from (242, 134) to (206, 240).
; PLAN: r0=242(x1), r1=134(y1), r2=206(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 134
LDI r2, 206
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
