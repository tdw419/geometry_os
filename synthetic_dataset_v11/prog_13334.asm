; DESCRIPTION: Draws a black line from (239, 215) to (186, 54).
; PLAN: r0=239(x1), r1=215(y1), r2=186(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 215
LDI r2, 186
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
