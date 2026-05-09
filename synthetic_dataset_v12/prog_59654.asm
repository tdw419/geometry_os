; DESCRIPTION: Renders a cyan line between points (398, 196) and (488, 85).
; PLAN: r0=398(x1), r1=196(y1), r2=488(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 196
LDI r2, 488
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
