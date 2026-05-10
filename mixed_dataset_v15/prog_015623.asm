; DESCRIPTION: Places a green 108x86 rectangle at position (400, 19).
; PLAN: r0=400(x), r1=19(y), r2=108(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 19
LDI r2, 108
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
