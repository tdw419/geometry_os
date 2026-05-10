; DESCRIPTION: Draws a white line from (95, 154) to (239, 192).
; PLAN: r0=95(x1), r1=154(y1), r2=239(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 154
LDI r2, 239
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
