; DESCRIPTION: Places a cyan 82x98 rectangle at position (117, 139).
; PLAN: r0=117(x), r1=139(y), r2=82(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 139
LDI r2, 82
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
