; DESCRIPTION: Renders a cyan line between points (191, 182) and (220, 239).
; PLAN: r0=191(x1), r1=182(y1), r2=220(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 182
LDI r2, 220
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
