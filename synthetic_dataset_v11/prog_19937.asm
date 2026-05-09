; DESCRIPTION: Composite: . Then Creates a orange circular shape at (184, 103) with radius 38. Then Creates a cyan rectangular region at (172, 74) spanning 41 by 120 pixels.
; PLAN: r0=184(x), r1=103(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=172(x), r1=74(y), r2=41(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (184, 103) with radius 38.
; PLAN: r0=184(x), r1=103(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 103
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (172, 74) spanning 41 by 120 pixels.
; PLAN: r0=172(x), r1=74(y), r2=41(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 74
LDI r2, 41
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
