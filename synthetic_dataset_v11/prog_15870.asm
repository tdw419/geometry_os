; DESCRIPTION: Composite: . Then Places a white 11x115 rectangle at position (230, 53). Then Renders a cyan disk with center (206, 210) and radius 11.
; PLAN: r0=230(x), r1=53(y), r2=11(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=206(x), r1=210(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white 11x115 rectangle at position (230, 53).
; PLAN: r0=230(x), r1=53(y), r2=11(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 53
LDI r2, 11
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (206, 210) and radius 11.
; PLAN: r0=206(x), r1=210(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 210
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
