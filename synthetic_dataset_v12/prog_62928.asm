; DESCRIPTION: Composite: Places a cyan line segment connecting (284, 145) to (230, 70) then Places a white dot at position (382, 253) then Renders a black box of size 103x64 starting at (400, 191).
; PLAN: r0=284(x1), r1=145(y1), r2=230(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=253(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=400(x), r11=191(y), r12=103(width), r13=64(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 145
LDI r2, 230
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 253
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 400
LDI r11, 191
LDI r12, 103
LDI r13, 64
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
