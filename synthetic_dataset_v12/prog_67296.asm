; DESCRIPTION: Composite: Renders a green line between points (198, 230) and (435, 55) then Renders a red box of size 61x16 starting at (439, 111) then Sets a single green pixel at (472, 15).
; PLAN: r0=198(x1), r1=230(y1), r2=435(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=111(y), r7=61(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x), r11=15(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 230
LDI r2, 435
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 111
LDI r7, 61
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 15
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
