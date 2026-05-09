; DESCRIPTION: Composite: . Then Places a yellow circle of radius 57 at center (123, 61). Then Creates a cyan rectangular region at (128, 175) spanning 90 by 40 pixels.
; PLAN: r0=123(x), r1=61(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x), r1=175(y), r2=90(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 57 at center (123, 61).
; PLAN: r0=123(x), r1=61(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 61
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (128, 175) spanning 90 by 40 pixels.
; PLAN: r0=128(x), r1=175(y), r2=90(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 175
LDI r2, 90
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
