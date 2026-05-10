; DESCRIPTION: Renders a green box of size 44x20 starting at (460, 131).
; PLAN: r0=460(x), r1=131(y), r2=44(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 131
LDI r2, 44
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
