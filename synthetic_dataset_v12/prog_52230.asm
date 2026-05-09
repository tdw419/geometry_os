; DESCRIPTION: Places a white line segment connecting (442, 130) to (305, 139).
; PLAN: r0=442(x1), r1=130(y1), r2=305(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 130
LDI r2, 305
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
