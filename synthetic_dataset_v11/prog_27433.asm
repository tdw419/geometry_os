; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (114, 59) spanning 41 by 16 pixels. Then Draws a yellow circle centered at (120, 78) with radius 32.
; PLAN: r0=114(x), r1=59(y), r2=41(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=120(x), r1=78(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a cyan rectangular region at (114, 59) spanning 41 by 16 pixels.
; PLAN: r0=114(x), r1=59(y), r2=41(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 59
LDI r2, 41
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (120, 78) with radius 32.
; PLAN: r0=120(x), r1=78(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 78
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
