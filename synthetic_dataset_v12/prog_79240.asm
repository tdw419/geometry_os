; DESCRIPTION: Composite: Places a purple line segment connecting (501, 25) to (280, 44) then Renders a cyan box of size 30x30 starting at (192, 182).
; PLAN: r0=501(x1), r1=25(y1), r2=280(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=182(y), r7=30(width), r8=30(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 25
LDI r2, 280
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 182
LDI r7, 30
LDI r8, 30
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
