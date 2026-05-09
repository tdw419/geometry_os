; DESCRIPTION: Places a red line segment connecting (59, 159) to (215, 55).
; PLAN: r0=59(x1), r1=159(y1), r2=215(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 159
LDI r2, 215
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
