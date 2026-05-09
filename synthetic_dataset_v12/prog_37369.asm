; DESCRIPTION: Places a cyan 39x107 rectangle at position (120, 26).
; PLAN: r0=120(x), r1=26(y), r2=39(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 26
LDI r2, 39
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
