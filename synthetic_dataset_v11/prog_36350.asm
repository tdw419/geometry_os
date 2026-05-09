; DESCRIPTION: Renders a cyan line between points (58, 5) and (67, 83).
; PLAN: r0=58(x1), r1=5(y1), r2=67(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 5
LDI r2, 67
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
