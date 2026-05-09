; DESCRIPTION: Composite: . Then Draws a red circle centered at (83, 168) with radius 17. Then Places a cyan 37x78 rectangle at position (20, 127).
; PLAN: r0=83(x), r1=168(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=20(x), r1=127(y), r2=37(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (83, 168) with radius 17.
; PLAN: r0=83(x), r1=168(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 168
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 37x78 rectangle at position (20, 127).
; PLAN: r0=20(x), r1=127(y), r2=37(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 127
LDI r2, 37
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
