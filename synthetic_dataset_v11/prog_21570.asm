; DESCRIPTION: Composite: . Then Renders a black disk with center (187, 108) and radius 66. Then Places a cyan 21x86 rectangle at position (175, 138).
; PLAN: r0=187(x), r1=108(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x), r1=138(y), r2=21(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (187, 108) and radius 66.
; PLAN: r0=187(x), r1=108(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 108
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 21x86 rectangle at position (175, 138).
; PLAN: r0=175(x), r1=138(y), r2=21(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 138
LDI r2, 21
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
