; DESCRIPTION: Renders a green line between points (71, 69) and (469, 16).
; PLAN: r0=71(x1), r1=69(y1), r2=469(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 69
LDI r2, 469
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
