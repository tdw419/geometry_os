; DESCRIPTION: Places a cyan 81x39 rectangle at position (292, 108).
; PLAN: r0=292(x), r1=108(y), r2=81(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 108
LDI r2, 81
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
