; DESCRIPTION: Composite: Places a green dot at position (450, 2) then Places a green line segment connecting (216, 203) to (146, 239) then Draws a red circle centered at (228, 184) with radius 50.
; PLAN: r0=450(x), r1=2(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=216(x1), r6=203(y1), r7=146(x2), r8=239(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=184(y), r12=50(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 450
LDI r1, 2
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 216
LDI r6, 203
LDI r7, 146
LDI r8, 239
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 184
LDI r12, 50
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
