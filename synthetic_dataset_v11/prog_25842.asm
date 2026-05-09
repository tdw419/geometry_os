; DESCRIPTION: Composite: . Then Places a black 120x40 rectangle at position (44, 65). Then Renders a cyan disk with center (176, 93) and radius 74.
; PLAN: r0=44(x), r1=65(y), r2=120(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x), r1=93(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 120x40 rectangle at position (44, 65).
; PLAN: r0=44(x), r1=65(y), r2=120(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 65
LDI r2, 120
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (176, 93) and radius 74.
; PLAN: r0=176(x), r1=93(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 93
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
