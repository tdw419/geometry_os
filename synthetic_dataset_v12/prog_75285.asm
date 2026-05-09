; DESCRIPTION: Composite: Creates a white rectangular region at (92, 179) spanning 117 by 68 pixels then Places a blue dot at position (346, 196) then Places a green line segment connecting (506, 115) to (162, 30).
; PLAN: r0=92(x), r1=179(y), r2=117(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=196(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=506(x1), r11=115(y1), r12=162(x2), r13=30(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 179
LDI r2, 117
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 196
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 506
LDI r11, 115
LDI r12, 162
LDI r13, 30
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
