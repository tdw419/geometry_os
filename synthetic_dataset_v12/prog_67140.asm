; DESCRIPTION: Composite: Renders a red line between points (92, 245) and (333, 32) then Renders a magenta box of size 80x67 starting at (232, 81).
; PLAN: r0=92(x1), r1=245(y1), r2=333(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=81(y), r7=80(width), r8=67(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 245
LDI r2, 333
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 81
LDI r7, 80
LDI r8, 67
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
