; DESCRIPTION: Places a white line segment connecting (406, 129) to (420, 41).
; PLAN: r0=406(x1), r1=129(y1), r2=420(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 129
LDI r2, 420
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
