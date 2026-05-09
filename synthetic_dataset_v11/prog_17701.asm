; DESCRIPTION: Places a black 54x86 rectangle at position (193, 27).
; PLAN: r0=193(x), r1=27(y), r2=54(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 27
LDI r2, 54
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
