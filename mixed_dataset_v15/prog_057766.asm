; DESCRIPTION: Composite: Draws a white rectangle at (301, 21) with width 120 and height 95 then Sets a single black pixel at (142, 207).
; PLAN: r0=301(x), r1=21(y), r2=120(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=207(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 21
LDI r2, 120
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 207
LDI r7, 0x000000
PSET r5, r6, r7
HALT
