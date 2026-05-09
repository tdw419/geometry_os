; DESCRIPTION: Composite: Draws a cyan circle centered at (236, 92) with radius 24 then Renders a red box of size 107x92 starting at (50, 39) then Places a blue line segment connecting (210, 197) to (190, 131).
; PLAN: r0=236(x), r1=92(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=39(y), r7=107(width), r8=92(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x1), r11=197(y1), r12=190(x2), r13=131(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 92
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 39
LDI r7, 107
LDI r8, 92
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 197
LDI r12, 190
LDI r13, 131
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
