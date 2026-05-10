; DESCRIPTION: Composite: Draws a red circle centered at (482, 205) with radius 27 then Renders a green line between points (403, 146) and (483, 192).
; PLAN: r0=482(x), r1=205(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=146(y1), r7=483(x2), r8=192(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 205
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 146
LDI r7, 483
LDI r8, 192
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
