; DESCRIPTION: Composite: Creates a purple rectangular region at (292, 69) spanning 33 by 10 pixels then Places a green line segment connecting (277, 26) to (313, 229).
; PLAN: r0=292(x), r1=69(y), r2=33(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=26(y1), r7=313(x2), r8=229(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 69
LDI r2, 33
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 26
LDI r7, 313
LDI r8, 229
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
