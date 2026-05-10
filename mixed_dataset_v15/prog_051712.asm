; DESCRIPTION: Composite: Sets a single cyan pixel at (117, 46) then Places a green 53x82 rectangle at position (447, 103) then Places a blue line segment connecting (459, 228) to (260, 165).
; PLAN: r0=117(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=103(y), r7=53(width), r8=82(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=459(x1), r11=228(y1), r12=260(x2), r13=165(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 447
LDI r6, 103
LDI r7, 53
LDI r8, 82
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 228
LDI r12, 260
LDI r13, 165
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
