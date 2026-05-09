; DESCRIPTION: Places a cyan 105x47 rectangle at position (108, 103).
; PLAN: r0=108(x), r1=103(y), r2=105(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 103
LDI r2, 105
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
