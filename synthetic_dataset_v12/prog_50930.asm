; DESCRIPTION: Renders a red line between points (285, 238) and (206, 42).
; PLAN: r0=285(x1), r1=238(y1), r2=206(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 238
LDI r2, 206
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
