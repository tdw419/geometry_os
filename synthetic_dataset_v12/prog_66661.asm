; DESCRIPTION: Composite: Renders a red box of size 40x82 starting at (213, 144) then Renders a orange line between points (430, 221) and (213, 63).
; PLAN: r0=213(x), r1=144(y), r2=40(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x1), r6=221(y1), r7=213(x2), r8=63(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 144
LDI r2, 40
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 221
LDI r7, 213
LDI r8, 63
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
