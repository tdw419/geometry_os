; DESCRIPTION: Places a yellow 21x86 rectangle at position (94, 130).
; PLAN: r0=94(x), r1=130(y), r2=21(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 130
LDI r2, 21
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
