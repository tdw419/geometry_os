; DESCRIPTION: Composite: Draws a black rectangle at (128, 112) with width 42 and height 15 then Draws a blue line from (168, 180) to (396, 202).
; PLAN: r0=128(x), r1=112(y), r2=42(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x1), r6=180(y1), r7=396(x2), r8=202(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 112
LDI r2, 42
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 180
LDI r7, 396
LDI r8, 202
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
