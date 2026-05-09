; DESCRIPTION: Composite: Creates a green circular shape at (202, 168) with radius 75 then Renders a blue line between points (339, 62) and (46, 42).
; PLAN: r0=202(x), r1=168(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x1), r6=62(y1), r7=46(x2), r8=42(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 168
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 62
LDI r7, 46
LDI r8, 42
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
