; DESCRIPTION: Composite: Places a blue circle of radius 44 at center (290, 129) then Renders a magenta box of size 68x45 starting at (151, 161).
; PLAN: r0=290(x), r1=129(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=161(y), r7=68(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 129
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 161
LDI r7, 68
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
