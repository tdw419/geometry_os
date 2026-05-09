; DESCRIPTION: Composite: Renders a orange box of size 92x98 starting at (326, 86) then Places a yellow line segment connecting (3, 225) to (224, 111).
; PLAN: r0=326(x), r1=86(y), r2=92(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x1), r6=225(y1), r7=224(x2), r8=111(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 86
LDI r2, 92
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 225
LDI r7, 224
LDI r8, 111
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
