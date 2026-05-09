; DESCRIPTION: Composite: Renders a cyan disk with center (392, 102) and radius 74 then Renders a cyan box of size 38x75 starting at (325, 121).
; PLAN: r0=392(x), r1=102(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=121(y), r7=38(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 102
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 121
LDI r7, 38
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
