; DESCRIPTION: Composite: Draws a green line from (273, 155) to (298, 219) then Renders a orange box of size 78x68 starting at (242, 53).
; PLAN: r0=273(x1), r1=155(y1), r2=298(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=53(y), r7=78(width), r8=68(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 155
LDI r2, 298
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 53
LDI r7, 78
LDI r8, 68
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
