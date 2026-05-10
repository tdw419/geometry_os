; DESCRIPTION: Draws a white line from (239, 0) to (267, 55).
; PLAN: r0=239(x1), r1=0(y1), r2=267(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 0
LDI r2, 267
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
