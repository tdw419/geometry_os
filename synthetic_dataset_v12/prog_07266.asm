; DESCRIPTION: Composite: Creates a red rectangular region at (40, 35) spanning 97 by 120 pixels then Places a yellow dot at position (259, 178).
; PLAN: r0=40(x), r1=35(y), r2=97(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x), r6=178(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 40
LDI r1, 35
LDI r2, 97
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 178
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
