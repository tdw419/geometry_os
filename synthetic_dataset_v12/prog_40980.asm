; DESCRIPTION: Composite: Renders a white box of size 71x12 starting at (186, 140) then Places a white line segment connecting (403, 123) to (338, 67).
; PLAN: r0=186(x), r1=140(y), r2=71(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=123(y1), r7=338(x2), r8=67(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 140
LDI r2, 71
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 123
LDI r7, 338
LDI r8, 67
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
