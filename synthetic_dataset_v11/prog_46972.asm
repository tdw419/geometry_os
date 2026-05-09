; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (31, 48) spanning 32 by 51 pixels. Then Renders a cyan disk with center (106, 157) and radius 59.
; PLAN: r0=31(x), r1=48(y), r2=32(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x), r1=157(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a yellow rectangular region at (31, 48) spanning 32 by 51 pixels.
; PLAN: r0=31(x), r1=48(y), r2=32(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 48
LDI r2, 32
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (106, 157) and radius 59.
; PLAN: r0=106(x), r1=157(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 157
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
