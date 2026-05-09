; DESCRIPTION: Places a cyan line segment connecting (240, 18) to (130, 189).
; PLAN: r0=240(x1), r1=18(y1), r2=130(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 18
LDI r2, 130
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
