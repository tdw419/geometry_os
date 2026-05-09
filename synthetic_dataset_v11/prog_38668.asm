; DESCRIPTION: Composite: . Then Renders a black disk with center (82, 195) and radius 13. Then Renders a orange box of size 24x41 starting at (142, 55).
; PLAN: r0=82(x), r1=195(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=142(x), r1=55(y), r2=24(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (82, 195) and radius 13.
; PLAN: r0=82(x), r1=195(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 195
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 24x41 starting at (142, 55).
; PLAN: r0=142(x), r1=55(y), r2=24(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 55
LDI r2, 24
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
