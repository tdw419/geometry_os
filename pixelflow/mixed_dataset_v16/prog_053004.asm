; DESCRIPTION: Draws a green line from (239, 228) to (332, 92).
; PLAN: r0=239(x1), r1=228(y1), r2=332(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 228
LDI r2, 332
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
