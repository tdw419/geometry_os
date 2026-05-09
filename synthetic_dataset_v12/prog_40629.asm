; DESCRIPTION: Draws a white line from (470, 242) to (384, 129).
; PLAN: r0=470(x1), r1=242(y1), r2=384(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 242
LDI r2, 384
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
