; DESCRIPTION: Renders a green line between points (191, 213) and (245, 62).
; PLAN: r0=191(x1), r1=213(y1), r2=245(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 213
LDI r2, 245
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
