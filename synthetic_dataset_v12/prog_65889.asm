; DESCRIPTION: Composite: Draws a red circle centered at (255, 61) with radius 20 then Renders a white line between points (42, 82) and (187, 54).
; PLAN: r0=255(x), r1=61(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=82(y1), r7=187(x2), r8=54(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 61
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 82
LDI r7, 187
LDI r8, 54
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
