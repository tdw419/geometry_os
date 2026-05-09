; DESCRIPTION: Places a cyan 82x105 rectangle at position (73, 102).
; PLAN: r0=73(x), r1=102(y), r2=82(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 102
LDI r2, 82
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
