; DESCRIPTION: Draws a green line from (164, 70) to (239, 254).
; PLAN: r0=164(x1), r1=70(y1), r2=239(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 70
LDI r2, 239
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
