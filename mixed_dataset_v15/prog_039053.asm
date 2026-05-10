; DESCRIPTION: Composite: Places a green line segment connecting (197, 141) to (420, 168) then Places a red 92x15 rectangle at position (6, 50) then Sets a single green pixel at (242, 20).
; PLAN: r0=197(x1), r1=141(y1), r2=420(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=50(y), r7=92(width), r8=15(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=242(x), r11=20(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 141
LDI r2, 420
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 50
LDI r7, 92
LDI r8, 15
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 20
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
