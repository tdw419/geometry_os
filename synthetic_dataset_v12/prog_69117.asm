; DESCRIPTION: Renders a cyan line between points (453, 239) and (21, 130).
; PLAN: r0=453(x1), r1=239(y1), r2=21(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 239
LDI r2, 21
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
