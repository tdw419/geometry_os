; DESCRIPTION: Renders a white line between points (239, 111) and (181, 248).
; PLAN: r0=239(x1), r1=111(y1), r2=181(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 111
LDI r2, 181
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
