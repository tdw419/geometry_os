; DESCRIPTION: Places a green line segment connecting (46, 164) to (167, 168).
; PLAN: r0=46(x1), r1=164(y1), r2=167(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 164
LDI r2, 167
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
