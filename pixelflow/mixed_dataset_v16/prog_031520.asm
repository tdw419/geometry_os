; DESCRIPTION: Composite: Creates a blue rectangular region at (28, 57) spanning 115 by 80 pixels then Places a black line segment connecting (113, 171) to (202, 27).
; PLAN: r0=28(x), r1=57(y), r2=115(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x1), r6=171(y1), r7=202(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 57
LDI r2, 115
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 171
LDI r7, 202
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
