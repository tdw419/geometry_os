; DESCRIPTION: Places a cyan 117x86 rectangle at position (78, 27).
; PLAN: r0=78(x), r1=27(y), r2=117(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 27
LDI r2, 117
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
