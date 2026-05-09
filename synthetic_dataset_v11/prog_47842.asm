; DESCRIPTION: Draws a green line from (197, 239) to (199, 0).
; PLAN: r0=197(x1), r1=239(y1), r2=199(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 239
LDI r2, 199
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
