; DESCRIPTION: Composite: Places a purple line segment connecting (220, 27) to (61, 70) then Renders a cyan disk with center (400, 90) and radius 35 then Places a black 103x92 rectangle at position (401, 119).
; PLAN: r0=220(x1), r1=27(y1), r2=61(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=90(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x), r11=119(y), r12=103(width), r13=92(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 27
LDI r2, 61
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 90
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 119
LDI r12, 103
LDI r13, 92
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
