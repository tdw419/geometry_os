; DESCRIPTION: Draws a green line from (500, 239) to (168, 193).
; PLAN: r0=500(x1), r1=239(y1), r2=168(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 239
LDI r2, 168
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
