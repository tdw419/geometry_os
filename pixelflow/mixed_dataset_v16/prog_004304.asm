; DESCRIPTION: Composite: Renders a magenta disk with center (206, 155) and radius 60 then Places a yellow 72x106 rectangle at position (345, 95).
; PLAN: r0=206(x), r1=155(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=95(y), r7=72(width), r8=106(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 155
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 95
LDI r7, 72
LDI r8, 106
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
