; DESCRIPTION: Renders a cyan line between points (200, 9) and (214, 20).
; PLAN: r0=200(x1), r1=9(y1), r2=214(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 9
LDI r2, 214
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
