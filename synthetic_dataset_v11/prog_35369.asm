; DESCRIPTION: Renders a magenta line between points (240, 107) and (239, 196).
; PLAN: r0=240(x1), r1=107(y1), r2=239(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 107
LDI r2, 239
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
