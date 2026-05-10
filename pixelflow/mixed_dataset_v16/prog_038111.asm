; DESCRIPTION: Places a white 108x86 rectangle at position (210, 33).
; PLAN: r0=210(x), r1=33(y), r2=108(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 33
LDI r2, 108
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
