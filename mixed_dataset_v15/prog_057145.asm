; DESCRIPTION: Composite: Sets a single black pixel at (275, 247) then Renders a red box of size 35x62 starting at (372, 109) then Draws a white line from (243, 240) to (493, 28).
; PLAN: r0=275(x), r1=247(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=109(y), r7=35(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x1), r11=240(y1), r12=493(x2), r13=28(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 247
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 372
LDI r6, 109
LDI r7, 35
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 240
LDI r12, 493
LDI r13, 28
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
