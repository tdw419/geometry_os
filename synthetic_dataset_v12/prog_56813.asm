; DESCRIPTION: Renders a green line between points (81, 228) and (364, 13).
; PLAN: r0=81(x1), r1=228(y1), r2=364(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 228
LDI r2, 364
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
