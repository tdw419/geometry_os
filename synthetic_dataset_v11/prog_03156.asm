; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (140, 49) with radius 38. Then Creates a white rectangular region at (186, 121) spanning 31 by 86 pixels.
; PLAN: r0=140(x), r1=49(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=186(x), r1=121(y), r2=31(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (140, 49) with radius 38.
; PLAN: r0=140(x), r1=49(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 49
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (186, 121) spanning 31 by 86 pixels.
; PLAN: r0=186(x), r1=121(y), r2=31(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 121
LDI r2, 31
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
