; DESCRIPTION: Renders a green line between points (499, 221) and (260, 224).
; PLAN: r0=499(x1), r1=221(y1), r2=260(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 221
LDI r2, 260
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
