; DESCRIPTION: Composite: Creates a magenta circular shape at (189, 129) with radius 52 then Places a magenta line segment connecting (148, 93) to (299, 113).
; PLAN: r0=189(x), r1=129(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x1), r6=93(y1), r7=299(x2), r8=113(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 129
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 93
LDI r7, 299
LDI r8, 113
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
