; DESCRIPTION: Composite: Renders a black box of size 55x120 starting at (126, 29) then Draws a blue line from (446, 78) to (292, 133).
; PLAN: r0=126(x), r1=29(y), r2=55(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=78(y1), r7=292(x2), r8=133(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 29
LDI r2, 55
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 78
LDI r7, 292
LDI r8, 133
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
