; DESCRIPTION: Composite: Draws a cyan line from (415, 2) to (81, 67) then Renders a purple box of size 36x19 starting at (439, 216).
; PLAN: r0=415(x1), r1=2(y1), r2=81(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=216(y), r7=36(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 2
LDI r2, 81
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 216
LDI r7, 36
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
