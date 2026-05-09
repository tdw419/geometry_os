; DESCRIPTION: Composite: Renders a green line between points (369, 103) and (84, 196) then Renders a white box of size 120x111 starting at (184, 119).
; PLAN: r0=369(x1), r1=103(y1), r2=84(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=119(y), r7=120(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 103
LDI r2, 84
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 119
LDI r7, 120
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
