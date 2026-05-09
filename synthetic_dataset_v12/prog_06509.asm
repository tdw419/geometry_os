; DESCRIPTION: Places a red line segment connecting (294, 42) to (426, 47).
; PLAN: r0=294(x1), r1=42(y1), r2=426(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 42
LDI r2, 426
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
