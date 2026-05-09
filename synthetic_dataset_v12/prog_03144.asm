; DESCRIPTION: Composite: Renders a yellow line between points (111, 196) and (2, 12) then Renders a purple box of size 72x16 starting at (7, 24).
; PLAN: r0=111(x1), r1=196(y1), r2=2(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=24(y), r7=72(width), r8=16(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 196
LDI r2, 2
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 24
LDI r7, 72
LDI r8, 16
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
