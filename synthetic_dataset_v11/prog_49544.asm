; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (38, 36) with width 27 and height 40. Then Creates a cyan circular shape at (109, 93) with radius 76.
; PLAN: r0=38(x), r1=36(y), r2=27(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=109(x), r1=93(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (38, 36) with width 27 and height 40.
; PLAN: r0=38(x), r1=36(y), r2=27(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 36
LDI r2, 27
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (109, 93) with radius 76.
; PLAN: r0=109(x), r1=93(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 93
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
