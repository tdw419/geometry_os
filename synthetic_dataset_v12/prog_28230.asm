; DESCRIPTION: Draws a white line from (198, 242) to (233, 222).
; PLAN: r0=198(x1), r1=242(y1), r2=233(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 242
LDI r2, 233
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
