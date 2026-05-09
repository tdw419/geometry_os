; DESCRIPTION: Places a white line segment connecting (215, 209) to (500, 38).
; PLAN: r0=215(x1), r1=209(y1), r2=500(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 209
LDI r2, 500
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
