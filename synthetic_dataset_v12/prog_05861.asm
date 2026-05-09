; DESCRIPTION: Renders a blue line between points (213, 42) and (21, 192).
; PLAN: r0=213(x1), r1=42(y1), r2=21(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 42
LDI r2, 21
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
