; DESCRIPTION: Renders a red line between points (397, 42) and (274, 134).
; PLAN: r0=397(x1), r1=42(y1), r2=274(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 42
LDI r2, 274
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
