; DESCRIPTION: Composite: . Then Places a magenta 88x86 rectangle at position (71, 68). Then Renders a green disk with center (186, 193) and radius 63.
; PLAN: r0=71(x), r1=68(y), r2=88(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=186(x), r1=193(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 88x86 rectangle at position (71, 68).
; PLAN: r0=71(x), r1=68(y), r2=88(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 68
LDI r2, 88
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (186, 193) and radius 63.
; PLAN: r0=186(x), r1=193(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 193
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
