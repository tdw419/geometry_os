; DESCRIPTION: Composite: . Then Renders a cyan box of size 79x60 starting at (128, 16). Then Places a blue circle of radius 43 at center (103, 165).
; PLAN: r0=128(x), r1=16(y), r2=79(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=103(x), r1=165(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 79x60 starting at (128, 16).
; PLAN: r0=128(x), r1=16(y), r2=79(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 16
LDI r2, 79
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 43 at center (103, 165).
; PLAN: r0=103(x), r1=165(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 165
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
