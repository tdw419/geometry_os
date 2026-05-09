; DESCRIPTION: Composite: . Then Renders a yellow box of size 38x67 starting at (30, 79). Then Renders a red disk with center (180, 178) and radius 72.
; PLAN: r0=30(x), r1=79(y), r2=38(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x), r1=178(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 38x67 starting at (30, 79).
; PLAN: r0=30(x), r1=79(y), r2=38(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 79
LDI r2, 38
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (180, 178) and radius 72.
; PLAN: r0=180(x), r1=178(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 178
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
