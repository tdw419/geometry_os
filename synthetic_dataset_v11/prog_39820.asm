; DESCRIPTION: Composite: . Then Renders a white disk with center (196, 233) and radius 21. Then Creates a cyan rectangular region at (141, 96) spanning 48 by 120 pixels.
; PLAN: r0=196(x), r1=233(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=141(x), r1=96(y), r2=48(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (196, 233) and radius 21.
; PLAN: r0=196(x), r1=233(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 233
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (141, 96) spanning 48 by 120 pixels.
; PLAN: r0=141(x), r1=96(y), r2=48(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 96
LDI r2, 48
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
