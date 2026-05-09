; DESCRIPTION: Composite: Renders a purple box of size 120x99 starting at (308, 86) then Places a cyan dot at position (482, 249) then Renders a red line between points (481, 238) and (120, 240).
; PLAN: r0=308(x), r1=86(y), r2=120(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=249(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=481(x1), r11=238(y1), r12=120(x2), r13=240(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 86
LDI r2, 120
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 249
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 481
LDI r11, 238
LDI r12, 120
LDI r13, 240
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
