; DESCRIPTION: Composite: Renders a magenta box of size 26x31 starting at (478, 53) then Places a orange line segment connecting (403, 12) to (503, 148).
; PLAN: r0=478(x), r1=53(y), r2=26(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=12(y1), r7=503(x2), r8=148(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 53
LDI r2, 26
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 12
LDI r7, 503
LDI r8, 148
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
