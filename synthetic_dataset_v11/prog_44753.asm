; DESCRIPTION: Renders a cyan line between points (217, 63) and (214, 88).
; PLAN: r0=217(x1), r1=63(y1), r2=214(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 63
LDI r2, 214
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
