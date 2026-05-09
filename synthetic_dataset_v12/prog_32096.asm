; DESCRIPTION: Composite: Places a cyan 85x120 rectangle at position (423, 47) then Places a cyan circle of radius 34 at center (269, 43) then Places a cyan line segment connecting (120, 85) to (242, 93).
; PLAN: r0=423(x), r1=47(y), r2=85(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x), r6=43(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x1), r11=85(y1), r12=242(x2), r13=93(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 47
LDI r2, 85
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 43
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 85
LDI r12, 242
LDI r13, 93
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
