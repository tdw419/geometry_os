; DESCRIPTION: Composite: Sets a single magenta pixel at (167, 196) then Renders a purple line between points (481, 152) and (377, 50) then Places a green 14x104 rectangle at position (101, 108).
; PLAN: r0=167(x), r1=196(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=481(x1), r6=152(y1), r7=377(x2), r8=50(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=108(y), r12=14(width), r13=104(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 196
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 481
LDI r6, 152
LDI r7, 377
LDI r8, 50
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 108
LDI r12, 14
LDI r13, 104
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
