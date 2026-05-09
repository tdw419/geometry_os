; DESCRIPTION: Places a green 40x86 rectangle at position (372, 70).
; PLAN: r0=372(x), r1=70(y), r2=40(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 70
LDI r2, 40
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
