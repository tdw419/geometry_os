; DESCRIPTION: Composite: . Then Places a cyan circle of radius 63 at center (156, 133). Then Creates a green rectangular region at (61, 176) spanning 11 by 42 pixels.
; PLAN: r0=156(x), r1=133(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=61(x), r1=176(y), r2=11(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 63 at center (156, 133).
; PLAN: r0=156(x), r1=133(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 133
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (61, 176) spanning 11 by 42 pixels.
; PLAN: r0=61(x), r1=176(y), r2=11(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 176
LDI r2, 11
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
