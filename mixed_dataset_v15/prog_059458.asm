; DESCRIPTION: Composite: Places a white line segment connecting (405, 253) to (317, 10) then Renders a magenta box of size 66x108 starting at (15, 15).
; PLAN: r0=405(x1), r1=253(y1), r2=317(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=15(y), r7=66(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 253
LDI r2, 317
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 15
LDI r7, 66
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
