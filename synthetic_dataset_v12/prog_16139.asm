; DESCRIPTION: Composite: Places a cyan line segment connecting (129, 27) to (164, 55) then Renders a white disk with center (217, 116) and radius 68.
; PLAN: r0=129(x1), r1=27(y1), r2=164(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=116(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 27
LDI r2, 164
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 116
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
