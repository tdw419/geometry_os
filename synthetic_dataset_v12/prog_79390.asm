; DESCRIPTION: Composite: Places a white circle of radius 74 at center (295, 173) then Places a yellow line segment connecting (190, 249) to (36, 91).
; PLAN: r0=295(x), r1=173(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x1), r6=249(y1), r7=36(x2), r8=91(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 173
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 249
LDI r7, 36
LDI r8, 91
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
