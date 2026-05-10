; DESCRIPTION: Composite: Places a cyan line segment connecting (117, 43) to (84, 182) then Renders a blue box of size 42x13 starting at (209, 215).
; PLAN: r0=117(x1), r1=43(y1), r2=84(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=215(y), r7=42(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 43
LDI r2, 84
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 215
LDI r7, 42
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
