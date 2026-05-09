; DESCRIPTION: Renders a cyan line between points (20, 196) and (134, 214).
; PLAN: r0=20(x1), r1=196(y1), r2=134(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 196
LDI r2, 134
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
