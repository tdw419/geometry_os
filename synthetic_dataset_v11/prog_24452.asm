; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (90, 130) with width 58 and height 72. Then Renders a red disk with center (101, 146) and radius 67.
; PLAN: r0=90(x), r1=130(y), r2=58(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=101(x), r1=146(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (90, 130) with width 58 and height 72.
; PLAN: r0=90(x), r1=130(y), r2=58(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 130
LDI r2, 58
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (101, 146) and radius 67.
; PLAN: r0=101(x), r1=146(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 146
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
