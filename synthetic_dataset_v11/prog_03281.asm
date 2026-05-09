; DESCRIPTION: Composite: . Then Renders a white line between points (228, 189) and (175, 28). Then Draws a purple rectangle at (20, 46) with width 111 and height 12.
; PLAN: r0=228(x1), r1=189(y1), r2=175(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=46(y), r2=111(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (228, 189) and (175, 28).
; PLAN: r0=228(x1), r1=189(y1), r2=175(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 189
LDI r2, 175
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (20, 46) with width 111 and height 12.
; PLAN: r0=20(x), r1=46(y), r2=111(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 46
LDI r2, 111
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
