; DESCRIPTION: Composite: . Then Renders a orange box of size 48x41 starting at (182, 4). Then Places a blue dot at position (240, 175).
; PLAN: r0=182(x), r1=4(y), r2=48(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=240(x), r1=175(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange box of size 48x41 starting at (182, 4).
; PLAN: r0=182(x), r1=4(y), r2=48(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 4
LDI r2, 48
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (240, 175).
; PLAN: r0=240(x), r1=175(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 175
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
