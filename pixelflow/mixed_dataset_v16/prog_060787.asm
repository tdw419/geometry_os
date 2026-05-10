; DESCRIPTION: Composite: Places a purple dot at position (394, 36) then Places a blue 37x120 rectangle at position (243, 113) then Draws a red circle centered at (266, 133) with radius 16.
; PLAN: r0=394(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=113(y), r7=37(width), r8=120(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=266(x), r11=133(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 394
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 113
LDI r7, 37
LDI r8, 120
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 133
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
