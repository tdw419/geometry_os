; DESCRIPTION: Composite: . Then Renders a cyan box of size 42x76 starting at (176, 73). Then Places a cyan circle of radius 17 at center (239, 19).
; PLAN: r0=176(x), r1=73(y), r2=42(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=239(x), r1=19(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 42x76 starting at (176, 73).
; PLAN: r0=176(x), r1=73(y), r2=42(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 73
LDI r2, 42
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 17 at center (239, 19).
; PLAN: r0=239(x), r1=19(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 19
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
