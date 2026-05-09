; DESCRIPTION: Composite: Renders a red box of size 19x23 starting at (128, 197) then Renders a red line between points (372, 75) and (30, 172).
; PLAN: r0=128(x), r1=197(y), r2=19(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x1), r6=75(y1), r7=30(x2), r8=172(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 197
LDI r2, 19
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 75
LDI r7, 30
LDI r8, 172
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
