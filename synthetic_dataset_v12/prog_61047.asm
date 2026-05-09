; DESCRIPTION: Composite: Sets a single magenta pixel at (488, 53) then Places a red line segment connecting (198, 60) to (14, 47) then Places a orange 103x113 rectangle at position (29, 9).
; PLAN: r0=488(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=198(x1), r6=60(y1), r7=14(x2), r8=47(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=29(x), r11=9(y), r12=103(width), r13=113(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 198
LDI r6, 60
LDI r7, 14
LDI r8, 47
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 9
LDI r12, 103
LDI r13, 113
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
