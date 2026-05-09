; DESCRIPTION: Composite: Places a orange line segment connecting (286, 151) to (65, 98) then Renders a white box of size 112x70 starting at (214, 113).
; PLAN: r0=286(x1), r1=151(y1), r2=65(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=113(y), r7=112(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 151
LDI r2, 65
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 113
LDI r7, 112
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
