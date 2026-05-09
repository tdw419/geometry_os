; DESCRIPTION: Composite: . Then Places a blue 31x50 rectangle at position (193, 140). Then Renders a white disk with center (146, 96) and radius 72.
; PLAN: r0=193(x), r1=140(y), r2=31(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=146(x), r1=96(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 31x50 rectangle at position (193, 140).
; PLAN: r0=193(x), r1=140(y), r2=31(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 140
LDI r2, 31
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (146, 96) and radius 72.
; PLAN: r0=146(x), r1=96(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 96
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
