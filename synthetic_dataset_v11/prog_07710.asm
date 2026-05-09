; DESCRIPTION: Composite: . Then Places a cyan 82x65 rectangle at position (13, 161). Then Creates a yellow circular shape at (114, 195) with radius 55.
; PLAN: r0=13(x), r1=161(y), r2=82(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=114(x), r1=195(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan 82x65 rectangle at position (13, 161).
; PLAN: r0=13(x), r1=161(y), r2=82(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 161
LDI r2, 82
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (114, 195) with radius 55.
; PLAN: r0=114(x), r1=195(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 195
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
