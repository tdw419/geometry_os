; DESCRIPTION: Composite: Places a cyan circle of radius 33 at center (346, 107) then Renders a blue box of size 36x69 starting at (202, 30) then Renders a white line between points (437, 0) and (296, 207).
; PLAN: r0=346(x), r1=107(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=30(y), r7=36(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=437(x1), r11=0(y1), r12=296(x2), r13=207(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 107
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 30
LDI r7, 36
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 0
LDI r12, 296
LDI r13, 207
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
