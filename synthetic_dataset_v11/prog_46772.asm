; DESCRIPTION: Composite: . Then Renders a magenta box of size 70x16 starting at (100, 216). Then Renders a cyan disk with center (92, 77) and radius 11.
; PLAN: r0=100(x), r1=216(y), r2=70(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=92(x), r1=77(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 70x16 starting at (100, 216).
; PLAN: r0=100(x), r1=216(y), r2=70(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 216
LDI r2, 70
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (92, 77) and radius 11.
; PLAN: r0=92(x), r1=77(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 77
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
