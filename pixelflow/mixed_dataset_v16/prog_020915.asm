; DESCRIPTION: Places a red line segment connecting (499, 45) to (228, 223).
; PLAN: r0=499(x1), r1=45(y1), r2=228(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 45
LDI r2, 228
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
