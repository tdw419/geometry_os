; DESCRIPTION: Places a green 27x13 rectangle at position (254, 19).
; PLAN: r0=254(x), r1=19(y), r2=27(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 19
LDI r2, 27
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
