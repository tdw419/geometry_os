; DESCRIPTION: Composite: Places a cyan circle of radius 77 at center (397, 91) then Draws a white line from (228, 245) to (290, 35) then Renders a orange box of size 22x104 starting at (279, 79).
; PLAN: r0=397(x), r1=91(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x1), r6=245(y1), r7=290(x2), r8=35(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=79(y), r12=22(width), r13=104(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 91
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 245
LDI r7, 290
LDI r8, 35
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 79
LDI r12, 22
LDI r13, 104
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
