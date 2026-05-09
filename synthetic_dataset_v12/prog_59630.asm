; DESCRIPTION: Composite: Renders a red line between points (381, 215) and (3, 47) then Places a cyan circle of radius 73 at center (95, 150) then Places a cyan 24x90 rectangle at position (182, 74).
; PLAN: r0=381(x1), r1=215(y1), r2=3(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=150(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x), r11=74(y), r12=24(width), r13=90(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 215
LDI r2, 3
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 150
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 74
LDI r12, 24
LDI r13, 90
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
