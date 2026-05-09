; DESCRIPTION: Renders a white line between points (59, 239) and (14, 67).
; PLAN: r0=59(x1), r1=239(y1), r2=14(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 239
LDI r2, 14
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
