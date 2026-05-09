; DESCRIPTION: Composite: Renders a orange box of size 29x56 starting at (267, 139) then Places a yellow line segment connecting (210, 235) to (465, 182).
; PLAN: r0=267(x), r1=139(y), r2=29(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x1), r6=235(y1), r7=465(x2), r8=182(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 139
LDI r2, 29
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 235
LDI r7, 465
LDI r8, 182
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
