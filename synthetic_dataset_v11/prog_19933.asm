; DESCRIPTION: Composite: . Then Renders a cyan line between points (203, 16) and (230, 242). Then Draws a red rectangle at (21, 112) with width 67 and height 73.
; PLAN: r0=203(x1), r1=16(y1), r2=230(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=21(x), r1=112(y), r2=67(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (203, 16) and (230, 242).
; PLAN: r0=203(x1), r1=16(y1), r2=230(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 16
LDI r2, 230
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (21, 112) with width 67 and height 73.
; PLAN: r0=21(x), r1=112(y), r2=67(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 112
LDI r2, 67
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
