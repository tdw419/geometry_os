; DESCRIPTION: Renders a green line between points (202, 87) and (499, 192).
; PLAN: r0=202(x1), r1=87(y1), r2=499(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 87
LDI r2, 499
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
