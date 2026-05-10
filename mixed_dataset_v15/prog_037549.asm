; DESCRIPTION: Composite: Places a white dot at position (123, 238) then Renders a purple box of size 57x22 starting at (67, 191) then Places a cyan line segment connecting (422, 253) to (184, 186).
; PLAN: r0=123(x), r1=238(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=191(y), r7=57(width), r8=22(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x1), r11=253(y1), r12=184(x2), r13=186(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 238
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 191
LDI r7, 57
LDI r8, 22
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 253
LDI r12, 184
LDI r13, 186
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
