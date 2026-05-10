; DESCRIPTION: Draws a red line from (386, 42) to (165, 109).
; PLAN: r0=386(x1), r1=42(y1), r2=165(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 42
LDI r2, 165
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
