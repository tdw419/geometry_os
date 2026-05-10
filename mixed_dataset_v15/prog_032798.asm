; DESCRIPTION: Composite: Places a yellow 80x10 rectangle at position (397, 64) then Places a white circle of radius 14 at center (336, 179) then Draws a green line from (275, 245) to (238, 177).
; PLAN: r0=397(x), r1=64(y), r2=80(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=179(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=275(x1), r11=245(y1), r12=238(x2), r13=177(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 64
LDI r2, 80
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 179
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 275
LDI r11, 245
LDI r12, 238
LDI r13, 177
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
