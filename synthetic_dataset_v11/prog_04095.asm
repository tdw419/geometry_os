; DESCRIPTION: Composite: . Then Renders a cyan disk with center (138, 70) and radius 17. Then Places a white 21x27 rectangle at position (4, 57).
; PLAN: r0=138(x), r1=70(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=4(x), r1=57(y), r2=21(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (138, 70) and radius 17.
; PLAN: r0=138(x), r1=70(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 70
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white 21x27 rectangle at position (4, 57).
; PLAN: r0=4(x), r1=57(y), r2=21(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 57
LDI r2, 21
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
