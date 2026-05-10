; DESCRIPTION: Composite: Sets a single blue pixel at (210, 167) then Renders a red box of size 97x61 starting at (198, 167) then Places a orange line segment connecting (242, 51) to (271, 42).
; PLAN: r0=210(x), r1=167(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=198(x), r6=167(y), r7=97(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=242(x1), r11=51(y1), r12=271(x2), r13=42(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 167
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 198
LDI r6, 167
LDI r7, 97
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 51
LDI r12, 271
LDI r13, 42
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
