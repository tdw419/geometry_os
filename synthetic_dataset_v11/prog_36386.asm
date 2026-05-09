; DESCRIPTION: Places a white line segment connecting (117, 239) to (252, 223).
; PLAN: r0=117(x1), r1=239(y1), r2=252(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 239
LDI r2, 252
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
