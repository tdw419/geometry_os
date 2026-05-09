; DESCRIPTION: Places a green line segment connecting (182, 146) to (434, 152).
; PLAN: r0=182(x1), r1=146(y1), r2=434(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 146
LDI r2, 434
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
