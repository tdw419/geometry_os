; DESCRIPTION: Places a yellow 76x21 rectangle at position (45, 12).
; PLAN: r0=45(x), r1=12(y), r2=76(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 12
LDI r2, 76
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
