; DESCRIPTION: Renders a cyan line between points (379, 208) and (416, 244).
; PLAN: r0=379(x1), r1=208(y1), r2=416(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 208
LDI r2, 416
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
