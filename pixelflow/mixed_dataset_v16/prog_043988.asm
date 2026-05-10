; DESCRIPTION: Places a cyan line segment connecting (288, 41) to (289, 169).
; PLAN: r0=288(x1), r1=41(y1), r2=289(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 41
LDI r2, 289
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
