; DESCRIPTION: Places a yellow line segment connecting (443, 215) to (404, 69).
; PLAN: r0=443(x1), r1=215(y1), r2=404(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 215
LDI r2, 404
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
