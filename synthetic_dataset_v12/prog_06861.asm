; DESCRIPTION: Places a red line segment connecting (268, 141) to (415, 42).
; PLAN: r0=268(x1), r1=141(y1), r2=415(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 141
LDI r2, 415
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
