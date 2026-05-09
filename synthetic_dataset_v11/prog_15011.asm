; DESCRIPTION: Draws a white line from (209, 166) to (239, 38).
; PLAN: r0=209(x1), r1=166(y1), r2=239(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 166
LDI r2, 239
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
