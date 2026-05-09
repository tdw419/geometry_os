; DESCRIPTION: Composite: . Then Renders a cyan disk with center (41, 36) and radius 28. Then Places a blue 59x16 rectangle at position (50, 40).
; PLAN: r0=41(x), r1=36(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=50(x), r1=40(y), r2=59(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (41, 36) and radius 28.
; PLAN: r0=41(x), r1=36(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 36
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 59x16 rectangle at position (50, 40).
; PLAN: r0=50(x), r1=40(y), r2=59(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 40
LDI r2, 59
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
