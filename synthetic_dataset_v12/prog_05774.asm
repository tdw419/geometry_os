; DESCRIPTION: Composite: Draws a blue rectangle at (348, 72) with width 48 and height 92 then Draws a black line from (45, 129) to (275, 131).
; PLAN: r0=348(x), r1=72(y), r2=48(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=129(y1), r7=275(x2), r8=131(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 72
LDI r2, 48
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 129
LDI r7, 275
LDI r8, 131
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
