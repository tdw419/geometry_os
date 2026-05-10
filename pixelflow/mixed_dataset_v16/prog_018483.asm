; DESCRIPTION: Composite: Places a green line segment connecting (134, 50) to (340, 40) then Renders a white box of size 59x49 starting at (5, 60).
; PLAN: r0=134(x1), r1=50(y1), r2=340(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=60(y), r7=59(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 50
LDI r2, 340
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 60
LDI r7, 59
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
