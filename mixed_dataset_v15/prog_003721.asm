; DESCRIPTION: Places a white 108x86 rectangle at position (193, 162).
; PLAN: r0=193(x), r1=162(y), r2=108(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 162
LDI r2, 108
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
