; DESCRIPTION: Composite: . Then Renders a cyan box of size 14x21 starting at (186, 32). Then Creates a green circular shape at (72, 149) with radius 38.
; PLAN: r0=186(x), r1=32(y), r2=14(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x), r1=149(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 14x21 starting at (186, 32).
; PLAN: r0=186(x), r1=32(y), r2=14(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 32
LDI r2, 14
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (72, 149) with radius 38.
; PLAN: r0=72(x), r1=149(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 149
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
