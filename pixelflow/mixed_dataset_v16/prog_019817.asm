; DESCRIPTION: Composite: Sets a single orange pixel at (392, 24) then Renders a red line between points (337, 119) and (170, 83) then Renders a red box of size 67x73 starting at (284, 141).
; PLAN: r0=392(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=119(y1), r7=170(x2), r8=83(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=284(x), r11=141(y), r12=67(width), r13=73(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 337
LDI r6, 119
LDI r7, 170
LDI r8, 83
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 141
LDI r12, 67
LDI r13, 73
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
