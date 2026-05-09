; DESCRIPTION: Renders a orange line between points (368, 224) and (214, 24).
; PLAN: r0=368(x1), r1=224(y1), r2=214(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 224
LDI r2, 214
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
