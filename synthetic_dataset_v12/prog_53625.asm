; DESCRIPTION: Places a cyan 39x35 rectangle at position (57, 119).
; PLAN: r0=57(x), r1=119(y), r2=39(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 119
LDI r2, 39
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
