; DESCRIPTION: Renders a magenta line between points (382, 107) and (239, 134).
; PLAN: r0=382(x1), r1=107(y1), r2=239(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 107
LDI r2, 239
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
