; DESCRIPTION: Composite: . Then Renders a cyan box of size 29x116 starting at (144, 120). Then Creates a green circular shape at (188, 130) with radius 16.
; PLAN: r0=144(x), r1=120(y), r2=29(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=188(x), r1=130(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 29x116 starting at (144, 120).
; PLAN: r0=144(x), r1=120(y), r2=29(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 120
LDI r2, 29
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (188, 130) with radius 16.
; PLAN: r0=188(x), r1=130(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 130
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
