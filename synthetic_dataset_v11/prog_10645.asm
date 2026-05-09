; DESCRIPTION: Places a cyan line segment connecting (236, 129) to (58, 171).
; PLAN: r0=236(x1), r1=129(y1), r2=58(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 129
LDI r2, 58
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
