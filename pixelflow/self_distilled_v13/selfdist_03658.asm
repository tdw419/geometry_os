; DESCRIPTION: Renders a cyan line segment connecting (39, 103) to (322, 91).
; PLAN: r0=39(x1), r1=103(y1), r2=322(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 103
LDI r2, 322
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
