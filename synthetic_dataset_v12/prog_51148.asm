; DESCRIPTION: Places a cyan 33x39 rectangle at position (50, 118).
; PLAN: r0=50(x), r1=118(y), r2=33(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 118
LDI r2, 33
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
