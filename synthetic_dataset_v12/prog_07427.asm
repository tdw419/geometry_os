; DESCRIPTION: Composite: Sets a single purple pixel at (21, 154) then Renders a red box of size 107x18 starting at (38, 197) then Draws a white line from (269, 66) to (237, 204).
; PLAN: r0=21(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=38(x), r6=197(y), r7=107(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x1), r11=66(y1), r12=237(x2), r13=204(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 38
LDI r6, 197
LDI r7, 107
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 66
LDI r12, 237
LDI r13, 204
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
