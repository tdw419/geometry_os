; DESCRIPTION: Renders a green line between points (139, 55) and (284, 73).
; PLAN: r0=139(x1), r1=55(y1), r2=284(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 55
LDI r2, 284
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
