; DESCRIPTION: Places a white 62x86 rectangle at position (433, 46).
; PLAN: r0=433(x), r1=46(y), r2=62(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 46
LDI r2, 62
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
