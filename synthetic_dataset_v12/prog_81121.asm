; DESCRIPTION: Composite: Places a blue dot at position (192, 214) then Draws a cyan rectangle at (260, 80) with width 42 and height 98 then Places a black line segment connecting (425, 124) to (327, 107).
; PLAN: r0=192(x), r1=214(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=80(y), r7=42(width), r8=98(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x1), r11=124(y1), r12=327(x2), r13=107(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 214
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 80
LDI r7, 42
LDI r8, 98
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 124
LDI r12, 327
LDI r13, 107
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
