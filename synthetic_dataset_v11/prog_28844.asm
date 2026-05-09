; DESCRIPTION: Places a cyan line segment connecting (149, 81) to (187, 174).
; PLAN: r0=149(x1), r1=81(y1), r2=187(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 81
LDI r2, 187
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
