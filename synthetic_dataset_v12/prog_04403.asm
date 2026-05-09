; DESCRIPTION: Renders a green line between points (342, 2) and (255, 210).
; PLAN: r0=342(x1), r1=2(y1), r2=255(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 2
LDI r2, 255
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
