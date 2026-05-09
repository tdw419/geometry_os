; DESCRIPTION: Places a white line segment connecting (403, 254) to (184, 204).
; PLAN: r0=403(x1), r1=254(y1), r2=184(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 254
LDI r2, 184
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
