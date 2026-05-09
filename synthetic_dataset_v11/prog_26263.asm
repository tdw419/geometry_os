; DESCRIPTION: Renders a magenta line between points (198, 124) and (239, 3).
; PLAN: r0=198(x1), r1=124(y1), r2=239(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 124
LDI r2, 239
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
