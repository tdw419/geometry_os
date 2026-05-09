; DESCRIPTION: Composite: . Then Places a magenta circle of radius 28 at center (213, 143). Then Places a red 29x23 rectangle at position (202, 166).
; PLAN: r0=213(x), r1=143(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=202(x), r1=166(y), r2=29(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 28 at center (213, 143).
; PLAN: r0=213(x), r1=143(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 143
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 29x23 rectangle at position (202, 166).
; PLAN: r0=202(x), r1=166(y), r2=29(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 166
LDI r2, 29
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
