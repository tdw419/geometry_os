; DESCRIPTION: Composite: Draws a yellow line from (96, 90) to (124, 242) then Renders a orange box of size 44x104 starting at (82, 103).
; PLAN: r0=96(x1), r1=90(y1), r2=124(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=103(y), r7=44(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 90
LDI r2, 124
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 103
LDI r7, 44
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
