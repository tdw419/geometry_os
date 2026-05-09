; DESCRIPTION: Composite: Renders a cyan box of size 62x63 starting at (232, 96) then Draws a green line from (67, 218) to (154, 59).
; PLAN: r0=232(x), r1=96(y), r2=62(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x1), r6=218(y1), r7=154(x2), r8=59(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 96
LDI r2, 62
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 218
LDI r7, 154
LDI r8, 59
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
