; DESCRIPTION: Composite: Sets a single yellow pixel at (284, 233) then Places a yellow circle of radius 71 at center (416, 72) then Draws a cyan line from (307, 73) to (458, 37).
; PLAN: r0=284(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=72(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x1), r11=73(y1), r12=458(x2), r13=37(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 233
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 416
LDI r6, 72
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 73
LDI r12, 458
LDI r13, 37
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
