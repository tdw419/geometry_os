; DESCRIPTION: Composite: Places a white line segment connecting (470, 250) to (1, 171) then Renders a blue box of size 93x76 starting at (113, 117).
; PLAN: r0=470(x1), r1=250(y1), r2=1(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=117(y), r7=93(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 250
LDI r2, 1
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 117
LDI r7, 93
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
