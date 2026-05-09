; DESCRIPTION: Places a cyan line segment connecting (129, 222) to (12, 174).
; PLAN: r0=129(x1), r1=222(y1), r2=12(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 222
LDI r2, 12
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
