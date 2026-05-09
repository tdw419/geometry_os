; DESCRIPTION: Renders a yellow line between points (154, 42) and (237, 167).
; PLAN: r0=154(x1), r1=42(y1), r2=237(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 42
LDI r2, 237
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
