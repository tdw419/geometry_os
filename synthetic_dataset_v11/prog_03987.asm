; DESCRIPTION: Renders a red line between points (150, 239) and (183, 48).
; PLAN: r0=150(x1), r1=239(y1), r2=183(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 239
LDI r2, 183
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
