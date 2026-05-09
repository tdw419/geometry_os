; DESCRIPTION: Renders a white line between points (70, 195) and (379, 198).
; PLAN: r0=70(x1), r1=195(y1), r2=379(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 195
LDI r2, 379
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
