; DESCRIPTION: Places a yellow line segment connecting (206, 168) to (174, 117).
; PLAN: r0=206(x1), r1=168(y1), r2=174(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 168
LDI r2, 174
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
