; DESCRIPTION: Places a cyan 47x24 rectangle at position (141, 171).
; PLAN: r0=141(x), r1=171(y), r2=47(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 171
LDI r2, 47
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
