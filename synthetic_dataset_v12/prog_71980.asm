; DESCRIPTION: Renders a cyan line between points (33, 103) and (238, 88).
; PLAN: r0=33(x1), r1=103(y1), r2=238(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 103
LDI r2, 238
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
