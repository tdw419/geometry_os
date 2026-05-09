; DESCRIPTION: Renders a orange line between points (113, 253) and (294, 16).
; PLAN: r0=113(x1), r1=253(y1), r2=294(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 253
LDI r2, 294
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
