; DESCRIPTION: Composite: Draws a magenta rectangle at (426, 59) with width 63 and height 48 then Places a green line segment connecting (404, 150) to (71, 194).
; PLAN: r0=426(x), r1=59(y), r2=63(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x1), r6=150(y1), r7=71(x2), r8=194(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 59
LDI r2, 63
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 150
LDI r7, 71
LDI r8, 194
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
