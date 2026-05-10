; DESCRIPTION: Composite: Places a blue line segment connecting (203, 136) to (236, 193) then Places a magenta 54x47 rectangle at position (289, 2) then Sets a single cyan pixel at (404, 180).
; PLAN: r0=203(x1), r1=136(y1), r2=236(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=2(y), r7=54(width), r8=47(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x), r11=180(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 136
LDI r2, 236
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 2
LDI r7, 54
LDI r8, 47
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 180
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
