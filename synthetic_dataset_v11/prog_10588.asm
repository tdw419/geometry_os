; DESCRIPTION: Composite: . Then Creates a red rectangular region at (131, 105) spanning 115 by 90 pixels. Then Places a cyan circle of radius 22 at center (55, 79).
; PLAN: r0=131(x), r1=105(y), r2=115(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=55(x), r1=79(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (131, 105) spanning 115 by 90 pixels.
; PLAN: r0=131(x), r1=105(y), r2=115(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 105
LDI r2, 115
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 22 at center (55, 79).
; PLAN: r0=55(x), r1=79(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 79
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
