; DESCRIPTION: Renders a white line between points (113, 135) and (182, 239).
; PLAN: r0=113(x1), r1=135(y1), r2=182(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 135
LDI r2, 182
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
