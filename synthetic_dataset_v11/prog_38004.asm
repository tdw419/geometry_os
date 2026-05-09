; DESCRIPTION: Composite: . Then Draws a black circle centered at (50, 96) with radius 42. Then Creates a cyan rectangular region at (33, 120) spanning 112 by 56 pixels.
; PLAN: r0=50(x), r1=96(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=33(x), r1=120(y), r2=112(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (50, 96) with radius 42.
; PLAN: r0=50(x), r1=96(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 96
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (33, 120) spanning 112 by 56 pixels.
; PLAN: r0=33(x), r1=120(y), r2=112(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 120
LDI r2, 112
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
