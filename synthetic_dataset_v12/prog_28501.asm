; DESCRIPTION: Composite: Draws a cyan line from (108, 44) to (334, 53) then Renders a orange box of size 47x109 starting at (201, 142).
; PLAN: r0=108(x1), r1=44(y1), r2=334(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=142(y), r7=47(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 44
LDI r2, 334
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 142
LDI r7, 47
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
