; DESCRIPTION: Renders a cyan line between points (421, 0) and (495, 214).
; PLAN: r0=421(x1), r1=0(y1), r2=495(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 0
LDI r2, 495
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
