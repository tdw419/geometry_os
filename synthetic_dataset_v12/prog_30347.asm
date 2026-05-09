; DESCRIPTION: Composite: Renders a white line between points (453, 74) and (253, 69) then Draws a orange rectangle at (218, 168) with width 59 and height 62 then Places a red dot at position (139, 24).
; PLAN: r0=453(x1), r1=74(y1), r2=253(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=168(y), r7=59(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=139(x), r11=24(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 74
LDI r2, 253
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 168
LDI r7, 59
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 24
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
