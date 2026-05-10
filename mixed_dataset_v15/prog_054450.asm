; DESCRIPTION: Renders a white line segment connecting (346, 59) to (172, 182).
; PLAN: r0=346(x1), r1=59(y1), r2=172(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 59
LDI r2, 172
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
