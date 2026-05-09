; DESCRIPTION: Composite: Draws a blue line from (98, 58) to (32, 70) then Renders a orange box of size 67x67 starting at (277, 99).
; PLAN: r0=98(x1), r1=58(y1), r2=32(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=99(y), r7=67(width), r8=67(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 58
LDI r2, 32
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 99
LDI r7, 67
LDI r8, 67
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
