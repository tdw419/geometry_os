; DESCRIPTION: Composite: . Then Renders a blue disk with center (149, 141) and radius 76. Then Renders a orange box of size 46x86 starting at (114, 50).
; PLAN: r0=149(x), r1=141(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=114(x), r1=50(y), r2=46(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (149, 141) and radius 76.
; PLAN: r0=149(x), r1=141(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 141
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 46x86 starting at (114, 50).
; PLAN: r0=114(x), r1=50(y), r2=46(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 50
LDI r2, 46
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
