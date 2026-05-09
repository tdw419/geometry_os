; DESCRIPTION: Composite: Places a magenta circle of radius 73 at center (167, 166) then Renders a cyan line between points (389, 173) and (481, 120) then Places a purple 74x104 rectangle at position (99, 42).
; PLAN: r0=167(x), r1=166(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x1), r6=173(y1), r7=481(x2), r8=120(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=42(y), r12=74(width), r13=104(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 166
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 173
LDI r7, 481
LDI r8, 120
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 42
LDI r12, 74
LDI r13, 104
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
