; DESCRIPTION: Composite: Renders a orange box of size 54x44 starting at (425, 63) then Places a red line segment connecting (108, 111) to (162, 223).
; PLAN: r0=425(x), r1=63(y), r2=54(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x1), r6=111(y1), r7=162(x2), r8=223(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 63
LDI r2, 54
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 111
LDI r7, 162
LDI r8, 223
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
