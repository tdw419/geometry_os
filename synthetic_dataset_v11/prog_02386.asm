; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (206, 87) spanning 12 by 48 pixels. Then Renders a cyan disk with center (76, 138) and radius 41.
; PLAN: r0=206(x), r1=87(y), r2=12(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=76(x), r1=138(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (206, 87) spanning 12 by 48 pixels.
; PLAN: r0=206(x), r1=87(y), r2=12(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 87
LDI r2, 12
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (76, 138) and radius 41.
; PLAN: r0=76(x), r1=138(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 138
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
