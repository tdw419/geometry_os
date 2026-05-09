; DESCRIPTION: Composite: Renders a purple box of size 30x116 starting at (252, 130) then Draws a blue line from (32, 69) to (479, 144).
; PLAN: r0=252(x), r1=130(y), r2=30(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x1), r6=69(y1), r7=479(x2), r8=144(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 130
LDI r2, 30
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 69
LDI r7, 479
LDI r8, 144
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
