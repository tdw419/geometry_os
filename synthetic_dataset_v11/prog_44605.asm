; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (175, 75) with radius 72. Then Places a magenta 42x56 rectangle at position (131, 67).
; PLAN: r0=175(x), r1=75(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=131(x), r1=67(y), r2=42(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (175, 75) with radius 72.
; PLAN: r0=175(x), r1=75(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 75
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 42x56 rectangle at position (131, 67).
; PLAN: r0=131(x), r1=67(y), r2=42(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 67
LDI r2, 42
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
