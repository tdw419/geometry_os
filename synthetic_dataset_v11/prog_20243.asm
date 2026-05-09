; DESCRIPTION: Composite: . Then Places a cyan 103x104 rectangle at position (29, 141). Then Renders a magenta disk with center (127, 176) and radius 34.
; PLAN: r0=29(x), r1=141(y), r2=103(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=127(x), r1=176(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan 103x104 rectangle at position (29, 141).
; PLAN: r0=29(x), r1=141(y), r2=103(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 141
LDI r2, 103
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (127, 176) and radius 34.
; PLAN: r0=127(x), r1=176(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 176
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
