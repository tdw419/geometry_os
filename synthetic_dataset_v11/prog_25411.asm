; DESCRIPTION: Renders a cyan line between points (214, 134) and (245, 196).
; PLAN: r0=214(x1), r1=134(y1), r2=245(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 134
LDI r2, 245
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
