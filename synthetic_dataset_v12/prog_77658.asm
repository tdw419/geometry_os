; DESCRIPTION: Renders a green line between points (22, 36) and (243, 228).
; PLAN: r0=22(x1), r1=36(y1), r2=243(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 36
LDI r2, 243
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
