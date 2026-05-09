; DESCRIPTION: Places a red line segment connecting (202, 91) to (387, 29).
; PLAN: r0=202(x1), r1=91(y1), r2=387(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 91
LDI r2, 387
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
