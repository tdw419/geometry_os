; DESCRIPTION: Composite: Places a cyan line segment connecting (503, 182) to (138, 127) then Renders a green disk with center (362, 30) and radius 21 then Places a white 70x90 rectangle at position (268, 100).
; PLAN: r0=503(x1), r1=182(y1), r2=138(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=30(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x), r11=100(y), r12=70(width), r13=90(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 503
LDI r1, 182
LDI r2, 138
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 30
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 100
LDI r12, 70
LDI r13, 90
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
