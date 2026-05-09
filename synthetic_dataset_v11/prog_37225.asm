; DESCRIPTION: Places a white line segment connecting (209, 111) to (92, 182).
; PLAN: r0=209(x1), r1=111(y1), r2=92(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 111
LDI r2, 92
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
