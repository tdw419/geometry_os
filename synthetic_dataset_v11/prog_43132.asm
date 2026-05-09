; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (9, 118) spanning 59 by 31 pixels. Then Places a red circle of radius 73 at center (88, 77).
; PLAN: r0=9(x), r1=118(y), r2=59(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=88(x), r1=77(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a cyan rectangular region at (9, 118) spanning 59 by 31 pixels.
; PLAN: r0=9(x), r1=118(y), r2=59(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 118
LDI r2, 59
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 73 at center (88, 77).
; PLAN: r0=88(x), r1=77(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 77
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
