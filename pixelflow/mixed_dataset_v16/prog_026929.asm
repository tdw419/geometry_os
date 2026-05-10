; DESCRIPTION: Places a white 31x15 rectangle at position (479, 219).
; PLAN: r0=479(x), r1=219(y), r2=31(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 219
LDI r2, 31
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
