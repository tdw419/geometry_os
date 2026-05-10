; DESCRIPTION: Composite: Renders a blue line between points (331, 141) and (426, 12) then Creates a black rectangular region at (464, 12) spanning 16 by 93 pixels.
; PLAN: r0=331(x1), r1=141(y1), r2=426(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=12(y), r7=16(width), r8=93(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 141
LDI r2, 426
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 12
LDI r7, 16
LDI r8, 93
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
