; DESCRIPTION: Composite: Renders a orange box of size 65x25 starting at (180, 88) then Places a orange line segment connecting (2, 230) to (367, 164).
; PLAN: r0=180(x), r1=88(y), r2=65(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=230(y1), r7=367(x2), r8=164(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 88
LDI r2, 65
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 230
LDI r7, 367
LDI r8, 164
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
