; DESCRIPTION: Composite: Sets a single white pixel at (113, 79) then Renders a green line between points (342, 108) and (367, 34) then Renders a white box of size 54x67 starting at (30, 106).
; PLAN: r0=113(x), r1=79(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=342(x1), r6=108(y1), r7=367(x2), r8=34(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=30(x), r11=106(y), r12=54(width), r13=67(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 79
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 342
LDI r6, 108
LDI r7, 367
LDI r8, 34
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 106
LDI r12, 54
LDI r13, 67
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
