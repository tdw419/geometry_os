; DESCRIPTION: Places a cyan line segment connecting (146, 200) to (131, 171).
; PLAN: r0=146(x1), r1=200(y1), r2=131(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 200
LDI r2, 131
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
