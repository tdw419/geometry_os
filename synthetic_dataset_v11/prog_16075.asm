; DESCRIPTION: Renders a yellow line between points (154, 44) and (165, 215).
; PLAN: r0=154(x1), r1=44(y1), r2=165(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 44
LDI r2, 165
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
