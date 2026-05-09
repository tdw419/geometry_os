; DESCRIPTION: Renders a magenta line between points (473, 228) and (242, 217).
; PLAN: r0=473(x1), r1=228(y1), r2=242(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 228
LDI r2, 242
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
