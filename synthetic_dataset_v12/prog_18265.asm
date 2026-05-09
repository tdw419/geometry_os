; DESCRIPTION: Renders a cyan line between points (53, 86) and (400, 0).
; PLAN: r0=53(x1), r1=86(y1), r2=400(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 86
LDI r2, 400
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
