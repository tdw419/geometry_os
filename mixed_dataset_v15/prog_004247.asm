; DESCRIPTION: Places a cyan 108x119 rectangle at position (372, 60).
; PLAN: r0=372(x), r1=60(y), r2=108(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 60
LDI r2, 108
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
