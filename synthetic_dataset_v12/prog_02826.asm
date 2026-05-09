; DESCRIPTION: Renders a white line between points (416, 245) and (333, 150).
; PLAN: r0=416(x1), r1=245(y1), r2=333(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 245
LDI r2, 333
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
