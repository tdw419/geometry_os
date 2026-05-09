; DESCRIPTION: Composite: . Then Sets a single green pixel at (33, 176). Then Renders a orange box of size 56x40 starting at (115, 184).
; PLAN: r0=33(x), r1=176(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=115(x), r1=184(y), r2=56(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (33, 176).
; PLAN: r0=33(x), r1=176(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 176
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 56x40 starting at (115, 184).
; PLAN: r0=115(x), r1=184(y), r2=56(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 184
LDI r2, 56
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
