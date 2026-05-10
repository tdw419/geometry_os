; DESCRIPTION: Composite: Renders a cyan box of size 67x67 starting at (307, 184) then Places a cyan line segment connecting (452, 211) to (194, 69).
; PLAN: r0=307(x), r1=184(y), r2=67(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x1), r6=211(y1), r7=194(x2), r8=69(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 184
LDI r2, 67
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 211
LDI r7, 194
LDI r8, 69
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
