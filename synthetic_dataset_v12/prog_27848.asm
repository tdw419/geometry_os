; DESCRIPTION: Composite: Places a blue 102x17 rectangle at position (368, 209) then Places a red line segment connecting (198, 98) to (398, 129).
; PLAN: r0=368(x), r1=209(y), r2=102(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x1), r6=98(y1), r7=398(x2), r8=129(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 209
LDI r2, 102
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 98
LDI r7, 398
LDI r8, 129
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
