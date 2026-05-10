; DESCRIPTION: Renders a cyan line between points (191, 203) and (86, 204).
; PLAN: r0=191(x1), r1=203(y1), r2=86(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 203
LDI r2, 86
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
