; DESCRIPTION: Composite: Creates a black rectangular region at (328, 129) spanning 11 by 39 pixels then Draws a orange line from (2, 187) to (224, 213).
; PLAN: r0=328(x), r1=129(y), r2=11(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=187(y1), r7=224(x2), r8=213(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 129
LDI r2, 11
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 187
LDI r7, 224
LDI r8, 213
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
