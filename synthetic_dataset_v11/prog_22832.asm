; DESCRIPTION: Places a cyan line segment connecting (171, 202) to (53, 168).
; PLAN: r0=171(x1), r1=202(y1), r2=53(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 202
LDI r2, 53
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
