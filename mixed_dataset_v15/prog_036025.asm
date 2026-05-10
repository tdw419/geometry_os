; DESCRIPTION: Composite: Draws a cyan line from (276, 159) to (395, 97) then Renders a red box of size 90x44 starting at (284, 2).
; PLAN: r0=276(x1), r1=159(y1), r2=395(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=2(y), r7=90(width), r8=44(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 159
LDI r2, 395
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 2
LDI r7, 90
LDI r8, 44
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
