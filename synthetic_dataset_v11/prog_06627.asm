; DESCRIPTION: Composite: . Then Places a cyan 27x26 rectangle at position (63, 191). Then Renders a white line between points (249, 243) and (10, 224).
; PLAN: r0=63(x), r1=191(y), r2=27(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x1), r1=243(y1), r2=10(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan 27x26 rectangle at position (63, 191).
; PLAN: r0=63(x), r1=191(y), r2=27(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 191
LDI r2, 27
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (249, 243) and (10, 224).
; PLAN: r0=249(x1), r1=243(y1), r2=10(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 243
LDI r2, 10
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
