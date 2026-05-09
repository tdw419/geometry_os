; DESCRIPTION: Composite: Renders a black box of size 93x91 starting at (217, 22) then Renders a blue line between points (397, 215) and (274, 113).
; PLAN: r0=217(x), r1=22(y), r2=93(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x1), r6=215(y1), r7=274(x2), r8=113(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 22
LDI r2, 93
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 215
LDI r7, 274
LDI r8, 113
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
