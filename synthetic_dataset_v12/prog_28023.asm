; DESCRIPTION: Draws a yellow line from (434, 239) to (339, 82).
; PLAN: r0=434(x1), r1=239(y1), r2=339(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 239
LDI r2, 339
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
