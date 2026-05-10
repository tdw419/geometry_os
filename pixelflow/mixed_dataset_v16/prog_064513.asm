; DESCRIPTION: Composite: Renders a cyan box of size 68x32 starting at (67, 49) then Renders a purple line between points (36, 25) and (74, 113).
; PLAN: r0=67(x), r1=49(y), r2=68(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x1), r6=25(y1), r7=74(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 49
LDI r2, 68
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 25
LDI r7, 74
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
