; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (173, 59) with width 58 and height 42. Then Creates a cyan circular shape at (206, 150) with radius 47.
; PLAN: r0=173(x), r1=59(y), r2=58(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=206(x), r1=150(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (173, 59) with width 58 and height 42.
; PLAN: r0=173(x), r1=59(y), r2=58(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 59
LDI r2, 58
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (206, 150) with radius 47.
; PLAN: r0=206(x), r1=150(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 150
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
