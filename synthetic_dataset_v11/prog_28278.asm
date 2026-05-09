; DESCRIPTION: Composite: . Then Renders a cyan disk with center (121, 121) and radius 51. Then Creates a cyan rectangular region at (13, 33) spanning 88 by 10 pixels.
; PLAN: r0=121(x), r1=121(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=13(x), r1=33(y), r2=88(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (121, 121) and radius 51.
; PLAN: r0=121(x), r1=121(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 121
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (13, 33) spanning 88 by 10 pixels.
; PLAN: r0=13(x), r1=33(y), r2=88(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 33
LDI r2, 88
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
