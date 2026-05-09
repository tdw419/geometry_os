; DESCRIPTION: Composite: . Then Renders a cyan disk with center (135, 88) and radius 79. Then Renders a red box of size 62x33 starting at (23, 135).
; PLAN: r0=135(x), r1=88(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x), r1=135(y), r2=62(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (135, 88) and radius 79.
; PLAN: r0=135(x), r1=88(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 88
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 62x33 starting at (23, 135).
; PLAN: r0=23(x), r1=135(y), r2=62(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 135
LDI r2, 62
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
