; DESCRIPTION: Composite: Places a cyan line segment connecting (125, 45) to (160, 104) then Renders a black box of size 119x86 starting at (391, 60).
; PLAN: r0=125(x1), r1=45(y1), r2=160(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=60(y), r7=119(width), r8=86(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 45
LDI r2, 160
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 60
LDI r7, 119
LDI r8, 86
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
