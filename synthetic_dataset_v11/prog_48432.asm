; DESCRIPTION: Composite: . Then Draws a red circle centered at (54, 178) with radius 45. Then Places a cyan 87x43 rectangle at position (127, 57).
; PLAN: r0=54(x), r1=178(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=127(x), r1=57(y), r2=87(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (54, 178) with radius 45.
; PLAN: r0=54(x), r1=178(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 178
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 87x43 rectangle at position (127, 57).
; PLAN: r0=127(x), r1=57(y), r2=87(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 57
LDI r2, 87
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
