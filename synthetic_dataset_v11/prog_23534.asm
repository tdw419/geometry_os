; DESCRIPTION: Places a red line segment connecting (42, 123) to (50, 125).
; PLAN: r0=42(x1), r1=123(y1), r2=50(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 123
LDI r2, 50
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
